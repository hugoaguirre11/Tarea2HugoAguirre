Feature: Proyecto
  @Tarea2
  Scenario: Como usuario quiero crear un proyecto para organizar Items
    Given autenticacion en todo.ly
    When Envio POST a 'api/items.json' con el json
    """
      {
          "Content":"CODIGO100"
      }
    """
    Then Se espera la respuesta 200
    And Se espera el Body sea igual
    """
    {
    "Id": "EXCLUDE",
    "Content": "CODIGO100",
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
    And Obtengo la propiedad de 'Id' y guardo en ID_PROJECT
    And Obtengo la propiedad de 'Content' y guardo en ITEM_PROJECT

    When Envio PUT a 'api/items/ID_PROJECT.json' con el json
    """
    {
        "Content": "ITEM_PROJECT 1001",
        "Checked":"true"
    }
    """
    Then Se espera la respuesta 200
    And Se espera el Body sea igual
    """
    {
    "Id": "EXCLUDE",
    "Content": "ITEM_PROJECT 1001",
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

    When Envio DELETE a 'api/items/ID_PROJECT.json' con el json
    """
    """
    Then Se espera la respuesta 200

    When Envio GET a 'api/items/ID_PROJECT.json' con el json
    """
    """
    Then Se espera la respuesta 200
    And Se espera el Body sea igual
    """
    {
    "Id": "EXCLUDE",
    "Content": "ITEM_PROJECT 1001",
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






