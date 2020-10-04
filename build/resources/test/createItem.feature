Feature: Proyecto
  @Tarea2
  Scenario: Como usuario quiero crear un proyecto para organizar Items
    Given Una autenticacion en todo.ly
    When Envio la solicitud POST a 'api/items.json' con el json
    """
      {
          "Content":"4000"
      }
    """
    Then Se espera el codigo de respuesta 200
    And Se espera que el Body de respuesta sea igual
    """
    {
    "Id": "EXCLUDE",
    "Content": "4000",
    "ItemType": 1,
    "Checked": false,
    "ProjectId": null,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": null,
    "Priority": 4,
    "LastSyncedDateTime": "EXCLUDE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "EXCLUDE",
    "LastCheckedDate": null,
    "LastUpdatedDate": "EXCLUDE",
    "Deleted": false,
    "Notes": "",
    "InHistory": false,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": "EXCLUDE"
    }
    """
    And Obtengo el valor de propiedad 'Id' y se guarda en ID_PROJECT
    And Obtengo el valor de propiedad 'Content' y se guarda en ITEM_PROJECT

    When Envio la solicitud PUT a 'api/items/ID_PROJECT.json' con el json
    """
    {
        "Content": "ITEM_PROJECT ABC",
        "Checked":"true"
    }
    """
    Then Se espera el codigo de respuesta 200
    And Se espera que el Body de respuesta sea igual
    """
    {
    "Id": "EXCLUDE",
    "Content": "ITEM_PROJECT ABC",
    "ItemType": 1,
    "Checked": true,
    "ProjectId": null,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": null,
    "Priority": 4,
    "LastSyncedDateTime": "EXCLUDE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "EXCLUDE",
    "LastCheckedDate": "EXCLUDE",
    "LastUpdatedDate": "EXCLUDE",
    "Deleted": "EXCLUDE",
    "Notes": "",
    "InHistory": true,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": "EXCLUDE"
    }
    """

    When Envio la solicitud DELETE a 'api/items/ID_PROJECT.json' con el json
    """
    """
    Then Se espera el codigo de respuesta 200

    When Envio la solicitud GET a 'api/items/ID_PROJECT.json' con el json
    """
    """
    Then Se espera el codigo de respuesta 200
    And Se espera que el Body de respuesta sea igual
    """
    {
    "Id": "EXCLUDE",
    "Content": "ITEM_PROJECT ABC",
    "ItemType": 1,
    "Checked": true,
    "ProjectId": null,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": null,
    "Priority": 4,
    "LastSyncedDateTime": "EXCLUDE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "EXCLUDE",
    "LastCheckedDate": "EXCLUDE",
    "LastUpdatedDate": "EXCLUDE",
    "Deleted": "EXCLUDE",
    "Notes": "",
    "InHistory": true,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": "EXCLUDE"
    }
    """






