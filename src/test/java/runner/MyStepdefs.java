package runner;

import clientAPI.FactoryRequest;
import clientAPI.RequestInformation;
import clientAPI.ResponseInformation;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import helpers.JsonHelper;
import org.json.JSONException;
import org.junit.Assert;

import java.util.HashMap;
import java.util.Map;

import static configuration.Configuration.*;

public class MyStepdefs {
    ResponseInformation response = new ResponseInformation();
    Map<String,String> variables = new HashMap<>();
    String method2;

    @Given("^autenticacion en todo\\.ly$")
    public void unaAutenticacionEnTodoLy() {
    }

    @When("^Envio (POST|PUT|DELETE|GET) a '(.*)' con el json$")
    public void envioLaSolicitudApiProjectConElJson(String method, String url,String jsonBody) {
        method2 = method;
        RequestInformation request = new RequestInformation();
        request.setUrl(HOST+this.replaceVariables(url));
        request.setBody(this.replaceVariables(jsonBody));
        request.addHeaders(BASIC_AUTHENTICATION_HEADER,BASIC_AUTHENTICATION);

        response = FactoryRequest.make(method.toLowerCase()).send(request);
    }

    @Then("^Se espera la respuesta (\\d+)$")
    public void seEsperaElCodigoDeRespuesta(int expectedResponseCode) {
        System.out.println("Codigo de respuesta "+response.getResponseCode());
        Assert.assertEquals("ERROR !! el codigo de respuesta es incorrecto",expectedResponseCode,response.getResponseCode());
    }

    @And("^Se espera el Body sea igual$")
    public void seEsperaQueElBodyDeRespuestaSeaIgual(String expectedResponseBody) throws JSONException {
        System.out.println("Body de respuesta: "+this.replaceVariables(response.getResponseBody()));
        Assert.assertTrue("ERROR el Body de respuesta de "+method2+" es incorrecto", JsonHelper.areEqualJSON(this.replaceVariables(expectedResponseBody),response.getResponseBody()));
    }

    @And("^Obtengo la propiedad de '(.*)' y guardo en (.*)$")
    public void obtengoElValorDePropiedadYSeGuardaEnVARIABLE(String property,String nameVariable) throws JSONException {
        String value = JsonHelper.getValueFromJSON(response.getResponseBody(),property);
        variables.put(nameVariable,value);

    }
    private String replaceVariables(String value){
        for (String key:this.variables.keySet()) {
            value = value.replace(key,this.variables.get(key));
        }
        return value;
    }
}
