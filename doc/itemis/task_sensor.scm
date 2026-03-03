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
            "text": "task_sensor Copy Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    // Entradas físicas (muestreadas en el update)\r\n    in event ev_up\r\n    in event ev_down\r\n    \r\n    // El tick del sistema (cada 1ms)\r\n    //in event ev_tick\r\n    \r\n    // Salidas (lo que se envía al sistema)\r\n    out event signal_up\r\n    out event signal_down\r\n    \r\n    // Variable interna para el tiempo de rebote\r\n    var tick_counter: integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -1544,
          "y": -239
        },
        "size": {
          "width": 1108,
          "height": 496
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "4b6b5548-0d72-47df-9780-25df33051e78",
        "z": 68,
        "embeds": [
          "72efd892-1c30-47dd-bfe8-07ce38eae2f3",
          "c4862606-63e4-4b64-b861-808f007b15a7",
          "38badb7e-d784-4efa-867c-6e873340d24f",
          "c561558b-7565-4faa-b815-8eaedf83a38e",
          "c1ea7939-3e6d-4ce7-9ab0-7e773d47e43f",
          "ea372ccc-e405-4e87-91e9-f92823e5f37e",
          "2f897d6d-a673-455c-ba20-dbaab0118cfd",
          "63b6eb49-415b-4844-b8d5-92ca4e5c5cc2",
          "eb275d0a-e18c-484b-a045-2bf7467f76bc",
          "96707e55-8e01-41ea-8d00-98e7805c3c94",
          "efff0ef6-245c-4ca3-9177-a000b6ef23f9",
          "4fb8c4fb-0c83-40e1-9196-8f5df51ed849"
        ]
      },
      {
        "position": {
          "x": -1379,
          "y": -187
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "z": 69,
        "id": "63b6eb49-415b-4844-b8d5-92ca4e5c5cc2",
        "embeds": [
          "35f9f63b-838a-445b-b715-ace54624395c"
        ],
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "position": {
          "x": -1273,
          "y": -187
        },
        "size": {
          "height": 60,
          "width": 70
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "z": 70,
        "id": "eb275d0a-e18c-484b-a045-2bf7467f76bc",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "position": {
          "x": -1167,
          "y": 55
        },
        "size": {
          "height": 60,
          "width": 176
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          },
          "specification": {
            "text": "every 1ms [tick_counter > 0] / tick_counter -= 1"
          }
        },
        "z": 72,
        "id": "96707e55-8e01-41ea-8d00-98e7805c3c94",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "position": {
          "x": -942,
          "y": -184
        },
        "size": {
          "height": 61,
          "width": 178
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          },
          "specification": {
            "text": "every 1ms [tick_counter > 0] / tick_counter -= 1"
          }
        },
        "z": 74,
        "id": "efff0ef6-245c-4ca3-9177-a000b6ef23f9",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "position": {
          "x": -826,
          "y": 52
        },
        "size": {
          "height": 60,
          "width": 88
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          }
        },
        "z": 77,
        "id": "4fb8c4fb-0c83-40e1-9196-8f5df51ed849",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -1379,
          "y": -172
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        },
        "parent": "63b6eb49-415b-4844-b8d5-92ca4e5c5cc2",
        "z": 81,
        "id": "35f9f63b-838a-445b-b715-ace54624395c"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "efff0ef6-245c-4ca3-9177-a000b6ef23f9"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "47.953%",
              "dy": "19.601%"
            },
            "name": "topLeft"
          },
          "id": "4fb8c4fb-0c83-40e1-9196-8f5df51ed849",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": " [tick_counter == 0 && ev_down] / raise signal_down"
              }
            },
            "position": {
              "distance": 0.3137254901960784,
              "offset": -163.9999969482422,
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 82,
        "id": "c4862606-63e4-4b64-b861-808f007b15a7",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4fb8c4fb-0c83-40e1-9196-8f5df51ed849"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "91.647%",
              "dy": "59.095%"
            },
            "name": "topLeft"
          },
          "id": "96707e55-8e01-41ea-8d00-98e7805c3c94",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ev_up / tick_counter = 20"
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -953,
            "y": 6
          }
        ],
        "z": 82,
        "id": "38badb7e-d784-4efa-867c-6e873340d24f",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "96707e55-8e01-41ea-8d00-98e7805c3c94"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "48.864%",
              "dy": "91.667%"
            },
            "name": "topLeft"
          },
          "id": "4fb8c4fb-0c83-40e1-9196-8f5df51ed849",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[tick_counter == 0 && ev_down]"
              }
            },
            "position": {
              "distance": 0.49032976946280454,
              "offset": 10,
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 82,
        "id": "72efd892-1c30-47dd-bfe8-07ce38eae2f3",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "96707e55-8e01-41ea-8d00-98e7805c3c94"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "44.286%",
              "dy": "98.333%"
            },
            "name": "topLeft"
          },
          "id": "eb275d0a-e18c-484b-a045-2bf7467f76bc",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[tick_counter == 0 && ev_up] / raise signal_up"
              }
            },
            "position": {
              "distance": 0.4876543209876543,
              "offset": -150,
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 82,
        "id": "ea372ccc-e405-4e87-91e9-f92823e5f37e",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "efff0ef6-245c-4ca3-9177-a000b6ef23f9",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.989%",
              "dy": "96.721%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "94.286%",
              "dy": "98.333%"
            },
            "name": "topLeft"
          },
          "id": "eb275d0a-e18c-484b-a045-2bf7467f76bc",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[tick_counter == 0 && ev_up]"
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -1081,
            "y": -82
          }
        ],
        "z": 82,
        "id": "c1ea7939-3e6d-4ce7-9ab0-7e773d47e43f",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "eb275d0a-e18c-484b-a045-2bf7467f76bc"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "4.724%",
              "dy": "57.685%"
            },
            "name": "topLeft"
          },
          "id": "efff0ef6-245c-4ca3-9177-a000b6ef23f9",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ev_down / tick_counter = 20"
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 82,
        "id": "c561558b-7565-4faa-b815-8eaedf83a38e",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "63b6eb49-415b-4844-b8d5-92ca4e5c5cc2"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "7.51%",
              "dy": "21.229%"
            },
            "name": "topLeft"
          },
          "id": "eb275d0a-e18c-484b-a045-2bf7467f76bc",
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 82,
        "id": "2f897d6d-a673-455c-ba20-dbaab0118cfd",
        "parent": "4b6b5548-0d72-47df-9780-25df33051e78"
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
          "moduleName": "TaskSensorCopy",
          "statemachinePrefix": "taskSensorCopy",
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