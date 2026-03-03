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
            "text": "task_set_up Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Eventos de entrada (vienen de los sensores)\n    in event ev_enter\n    in event ev_next\n    \n    // Evento de control (viene de app.c para entrar al modo)\n    in event ev_setup_start\n    \n    // Variables de configuración (lo que modificamos)\n    var umbral: integer = 3\n    var tiempo: integer = 5\n    \n    // Salida para avisar que volvemos a modo normal\n    out event ev_exit_to_normal"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -394,
          "y": -128
        },
        "size": {
          "width": 1049,
          "height": 423
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "c69d9369-0ae1-4669-9f15-ed407313f41e",
        "z": 52,
        "embeds": [
          "2a0b79f6-55cf-48e8-8399-9acafca2f461",
          "1dfb28ec-84d6-4073-8ddf-d6659507be41",
          "390c2205-b33d-4ded-a2ee-7c2730f3595b",
          "b6374f80-6baa-45e3-a5f2-86ef8fe54835",
          "237903f8-97d1-4eea-a38b-5754224afa78",
          "5a2852c6-f775-4946-976d-e90c8d7ac1ac",
          "7758f62a-2452-444a-a182-8efb27795b52",
          "d0508a5b-b893-45ce-958c-6db1d1efd353",
          "14171e60-fcb0-430c-999f-427085000484",
          "245e74f5-fe76-4a1f-ab01-1706e9cb6ceb",
          "6543e1f0-451e-4cb9-ac2e-ba1adb827dfd",
          "6698e018-5c58-45f0-a7af-a813ae016023",
          "e5474e1c-9dfe-40fa-b4d9-d05f6f9b942a"
        ]
      },
      {
        "position": {
          "x": -348,
          "y": -77
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "d0508a5b-b893-45ce-958c-6db1d1efd353",
        "z": 53,
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e",
        "embeds": [
          "3b7ac8cf-87b0-4055-857a-eefdb446e0e9"
        ]
      },
      {
        "position": {
          "x": 92,
          "y": -62
        },
        "size": {
          "width": 117,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UMBRAL",
            "fontSize": 11
          }
        },
        "id": "14171e60-fcb0-430c-999f-427085000484",
        "z": 54,
        "embeds": [
          "e1be7d60-f863-410e-ac84-1435e6c2648c"
        ],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "position": {
          "x": -285,
          "y": -55
        },
        "size": {
          "width": 93,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_IDLE",
            "fontSize": 11
          }
        },
        "id": "245e74f5-fe76-4a1f-ab01-1706e9cb6ceb",
        "z": 57,
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "position": {
          "x": -110,
          "y": -53
        },
        "size": {
          "width": 97,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_INICIO",
            "fontSize": 11
          }
        },
        "id": "6543e1f0-451e-4cb9-ac2e-ba1adb827dfd",
        "z": 59,
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -348,
          "y": -62
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "3b7ac8cf-87b0-4055-857a-eefdb446e0e9",
        "z": 62,
        "parent": "d0508a5b-b893-45ce-958c-6db1d1efd353"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "245e74f5-fe76-4a1f-ab01-1706e9cb6ceb"
        },
        "target": {
          "id": "6543e1f0-451e-4cb9-ac2e-ba1adb827dfd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.837%",
              "dy": "53.727%",
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
                "text": "ev_setup_start"
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
        "id": "237903f8-97d1-4eea-a38b-5754224afa78",
        "z": 63,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6543e1f0-451e-4cb9-ac2e-ba1adb827dfd"
        },
        "target": {
          "id": "14171e60-fcb0-430c-999f-427085000484",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.863%",
              "dy": "60.738%",
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
                "text": "ev_next"
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
        "id": "5a2852c6-f775-4946-976d-e90c8d7ac1ac",
        "z": 63,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "d0508a5b-b893-45ce-958c-6db1d1efd353"
        },
        "target": {
          "id": "245e74f5-fe76-4a1f-ab01-1706e9cb6ceb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.023%",
              "dy": "48.131%",
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
        "id": "7758f62a-2452-444a-a182-8efb27795b52",
        "z": 63,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "14171e60-fcb0-430c-999f-427085000484",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.128%",
              "dy": "1.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "14171e60-fcb0-430c-999f-427085000484",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "88.034%",
              "dy": "0%",
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
                "text": "ev_enter / umbral = (umbral < 10) ? umbral + 1 : 1"
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
        "id": "e1be7d60-f863-410e-ac84-1435e6c2648c",
        "z": 63,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "14171e60-fcb0-430c-999f-427085000484"
      },
      {
        "position": {
          "x": 359,
          "y": -64
        },
        "size": {
          "width": 99,
          "height": 65
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_TIEMPO",
            "fontSize": 11
          }
        },
        "id": "6698e018-5c58-45f0-a7af-a813ae016023",
        "z": 65,
        "embeds": [
          "59b929d7-caa3-4da5-bd08-935f226c62ef"
        ],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "14171e60-fcb0-430c-999f-427085000484"
        },
        "target": {
          "id": "6698e018-5c58-45f0-a7af-a813ae016023",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.819%",
              "dy": "56.754%",
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
                "text": "ev_next"
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
        "id": "b6374f80-6baa-45e3-a5f2-86ef8fe54835",
        "z": 66,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6698e018-5c58-45f0-a7af-a813ae016023",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.02%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "6698e018-5c58-45f0-a7af-a813ae016023",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "94.949%",
              "dy": "-1.538%",
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
                "text": "ev_enter / tiempo = (tiempo < 60) ? tiempo + 5 : 5"
              }
            },
            "position": {
              "distance": 0.8713000809561664,
              "offset": -52.70103779225818,
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
        "id": "59b929d7-caa3-4da5-bd08-935f226c62ef",
        "z": 66,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 407,
            "y": -86
          }
        ],
        "parent": "6698e018-5c58-45f0-a7af-a813ae016023"
      },
      {
        "position": {
          "x": 356,
          "y": 91
        },
        "size": {
          "width": 96,
          "height": 66
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SALIR",
            "fontSize": 11
          }
        },
        "id": "e5474e1c-9dfe-40fa-b4d9-d05f6f9b942a",
        "z": 74,
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6698e018-5c58-45f0-a7af-a813ae016023"
        },
        "target": {
          "id": "e5474e1c-9dfe-40fa-b4d9-d05f6f9b942a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.885%",
              "dy": "21.142%",
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
                "text": "ev_next"
              }
            },
            "position": {
              "distance": 0.475,
              "offset": -25.000014648437514,
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
        "id": "390c2205-b33d-4ded-a2ee-7c2730f3595b",
        "z": 75,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e5474e1c-9dfe-40fa-b4d9-d05f6f9b942a"
        },
        "target": {
          "id": "6543e1f0-451e-4cb9-ac2e-ba1adb827dfd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50.515%",
              "dy": "91.667%",
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
                "text": "ev_next"
              }
            },
            "position": {
              "distance": 0.49434208150071157,
              "offset": 9,
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
        "id": "1dfb28ec-84d6-4073-8ddf-d6659507be41",
        "z": 76,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e5474e1c-9dfe-40fa-b4d9-d05f6f9b942a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "38.148%",
              "dy": "97.415%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "245e74f5-fe76-4a1f-ab01-1706e9cb6ceb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.462%",
              "dy": "96.667%",
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
                "text": "ev_enter / raise ev_exit_to_normal"
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
        "id": "2a0b79f6-55cf-48e8-8399-9acafca2f461",
        "z": 82,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -239,
            "y": 126
          }
        ],
        "parent": "c69d9369-0ae1-4669-9f15-ed407313f41e"
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
          "moduleName": "TaskSetUp",
          "statemachinePrefix": "taskSetUp",
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