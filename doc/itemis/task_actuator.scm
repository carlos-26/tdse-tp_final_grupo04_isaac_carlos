{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "task_actuator Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Entrada lógica: ¿Está el sistema en modo activo?\n    var is_system_active : boolean = false\n    \n    // Tick del sistema (cada 1ms)\n    in event ev_tick\n    \n    // Salida física: Estado del LED\n    var led_output : boolean = false\n    \n    // Variable interna para el tiempo de parpadeo\n    var blink_timer : integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -417,
          "y": -220
        },
        "size": {
          "width": 901,
          "height": 425
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe",
        "z": 2,
        "embeds": [
          "55b7f527-b66f-4195-9ca2-eb5f232b3bf9",
          "5b3cf0bc-2d46-452b-ac74-bdf6b0297243",
          "8f8900e0-3045-4130-9a92-79d44e5f2aa6",
          "bb6da3e4-4245-4ed3-ae0f-2bb5390f1277",
          "cf33d977-ef3b-4551-8c98-ddec6deada14",
          "972dcfe0-cf7b-4404-a453-25c9f8db041e",
          "66856894-f943-4a26-9256-a6a16a02180a",
          "471e5fd9-1e87-4db6-a004-e159936c9fb8",
          "078caa42-32ee-4e13-9b75-1539d65b180a",
          "7da70138-2f0e-4801-9da6-422ec1fa1434",
          "aaf05a6c-73bf-4a41-b34d-a8aeb3efddf9"
        ]
      },
      {
        "position": {
          "x": -367,
          "y": -179
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "66856894-f943-4a26-9256-a6a16a02180a",
        "z": 3,
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe",
        "embeds": [
          "3b958a0d-d884-484a-9464-72c10e0146d9"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -367,
          "y": -164
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "3b958a0d-d884-484a-9464-72c10e0146d9",
        "z": 4,
        "parent": "66856894-f943-4a26-9256-a6a16a02180a"
      },
      {
        "position": {
          "x": 155,
          "y": -155
        },
        "size": {
          "width": 166,
          "height": 68
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BLINK_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /led_output = true\nevery 1ms [blink_timer > 0] / blink_timer -= 1"
          }
        },
        "id": "471e5fd9-1e87-4db6-a004-e159936c9fb8",
        "z": 17,
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "position": {
          "x": -219,
          "y": -150
        },
        "size": {
          "width": 148,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /led_output = false"
          }
        },
        "id": "078caa42-32ee-4e13-9b75-1539d65b180a",
        "z": 19,
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "66856894-f943-4a26-9256-a6a16a02180a"
        },
        "target": {
          "id": "078caa42-32ee-4e13-9b75-1539d65b180a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "10.538%",
              "dy": "57.944%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "972dcfe0-cf7b-4404-a453-25c9f8db041e",
        "z": 20,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -356,
            "y": -117.23
          }
        ],
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "078caa42-32ee-4e13-9b75-1539d65b180a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "95.946%",
              "dy": "15%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "471e5fd9-1e87-4db6-a004-e159936c9fb8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.614%",
              "dy": "20.588%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[is_system_active] \n/ blink_timer = 500"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "cf33d977-ef3b-4551-8c98-ddec6deada14",
        "z": 23,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "471e5fd9-1e87-4db6-a004-e159936c9fb8"
        },
        "target": {
          "id": "078caa42-32ee-4e13-9b75-1539d65b180a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.919%",
              "dy": "78.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[!is_system_active]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "bb6da3e4-4245-4ed3-ae0f-2bb5390f1277",
        "z": 24,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "position": {
          "x": -34,
          "y": 46
        },
        "size": {
          "width": 163,
          "height": 67
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BLINK_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / led_output = false\nevery 1ms [blink_timer > 0] / blink_timer -= 1"
          }
        },
        "id": "7da70138-2f0e-4801-9da6-422ec1fa1434",
        "z": 30,
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "471e5fd9-1e87-4db6-a004-e159936c9fb8"
        },
        "target": {
          "id": "7da70138-2f0e-4801-9da6-422ec1fa1434",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "87.7%",
              "dy": "71.369%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ev_tick [blink_timer == 0]\n/ blink_timer = 500"
              }
            },
            "position": {
              "distance": 0.38365514499276093,
              "offset": -78.00000000000001,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5b3cf0bc-2d46-452b-ac74-bdf6b0297243",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 239,
            "y": 19
          }
        ],
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7da70138-2f0e-4801-9da6-422ec1fa1434"
        },
        "target": {
          "id": "471e5fd9-1e87-4db6-a004-e159936c9fb8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.084%",
              "dy": "85.294%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ev_tick [blink_timer == 0]\n/ blink_timer = 500"
              }
            },
            "position": {
              "distance": 0.638121546961326,
              "offset": -79,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "8f8900e0-3045-4130-9a92-79d44e5f2aa6",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7da70138-2f0e-4801-9da6-422ec1fa1434"
        },
        "target": {
          "id": "078caa42-32ee-4e13-9b75-1539d65b180a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48.649%",
              "dy": "73.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[!is_system_active]"
              }
            },
            "position": {
              "distance": 0.391967546161314,
              "offset": -15.881815402406108,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "55b7f527-b66f-4195-9ca2-eb5f232b3bf9",
        "z": 32,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -147,
            "y": 79.5
          }
        ],
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      },
      {
        "type": "Note",
        "attrs": {
          "body": {
            "filter": {
              "args": {}
            }
          },
          "label": {
            "text": "El incremento o decremento\ndel timer se puede hacer manual\nsustituyendo every 1ms por ev_tick"
          }
        },
        "position": {
          "x": 243,
          "y": 136
        },
        "size": {
          "width": 234.3893280029297,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "aaf05a6c-73bf-4a41-b34d-a8aeb3efddf9",
        "z": 33,
        "parent": "b5ee310b-155c-416a-bbe1-d3c9e4c35fbe"
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "TaskActuator",
          "statemachinePrefix": "taskActuator",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}