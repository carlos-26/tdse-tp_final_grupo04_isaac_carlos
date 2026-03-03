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
            "text": "task_normal Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Eventos de entrada (vienen de task_sensor)\n    in event ev_person_in\n    in event ev_person_out\n    in event ev_activate\n    in event ev_deactivate\n    \n    // Ticks para el temporizador de frenado\n    in event ev_tick_1s\n    \n    // Condición de seguridad (Nivel lógico del Dip Switch)\n    in event ev_sys_desact\n    in event ev_sys_act\n    var ir_barrier_free : boolean = true\n    var ir_sys_desact : boolean = false\n    \n    // Parámetros configurables (vienen de task_set_up)\n    var threshold : integer = 3\n    var wait_time_cfg : integer = 5\n    \n    // Variables internas\n    var person_count : integer = 0\n    var timer_stop : integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -388,
          "y": -473
        },
        "size": {
          "width": 1358,
          "height": 703
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "dc75e984-6c6c-4ede-9a0d-7b84771b740b",
        "z": 134,
        "embeds": [
          "f71cb9db-eda6-4e8d-a40b-433f48656907",
          "ca95940c-60fd-42a4-b96d-0e1d48bb0643",
          "ce134f8e-8f83-449e-a2f6-15726c71fc4f",
          "99d3d0ef-b7d8-46e9-8c28-9b2c5d62f21f",
          "48d1ed8f-c7ba-40c0-9d9c-86008e7931ea",
          "d45be140-40c0-4fe7-9eda-4a4fa27b7b8c",
          "ebbc25a7-7484-475e-b125-e177999dcd0a",
          "bf2cf8e7-ede1-4727-8d36-4d92c8710aae",
          "6c0ead49-7f68-459b-a7b0-21f205a0a630",
          "d880c762-0d3a-455d-a110-5a4b7c2082e1",
          "c61af43e-669b-434b-9053-6fbb07e9041d",
          "45a2cc7d-35cb-4e6a-b540-9bce2eb79bae",
          "ed0d1f03-adb7-4c53-a474-410f5fff24b3",
          "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "60c37107-df43-4d22-88d4-45c575a4482f",
          "3e16c367-db0e-4d14-ae4b-e514854ca829",
          "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
          "e7b36c29-6905-49f8-a098-8b1582cd3ba5",
          "5aacae27-9d2a-41bf-b290-cf5cfb25148d"
        ]
      },
      {
        "position": {
          "x": 563,
          "y": -196
        },
        "size": {
          "width": 123,
          "height": 78
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_VEL_MIN",
            "fontSize": 11
          }
        },
        "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
        "z": 135,
        "embeds": [
          "d1d73ff8-5a2a-43eb-8240-13e171e7e04e",
          "8439780c-6585-4b75-a595-56442032d704"
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "position": {
          "x": 577,
          "y": 61
        },
        "size": {
          "width": 115,
          "height": 72
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_VEL_MAX",
            "fontSize": 11
          }
        },
        "id": "60c37107-df43-4d22-88d4-45c575a4482f",
        "z": 136,
        "embeds": [
          "e1b115a1-3b50-4ce0-9679-ccdfb1a464e3",
          "c37c03a4-b523-4796-961d-5513b2c6c5c0"
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "position": {
          "x": 153,
          "y": -193
        },
        "size": {
          "width": 79,
          "height": 63
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_IDLE",
            "fontSize": 11
          }
        },
        "id": "3e16c367-db0e-4d14-ae4b-e514854ca829",
        "z": 139,
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "position": {
          "x": -239,
          "y": -195
        },
        "size": {
          "width": 219,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_DESACTIVATED",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_sys_act / ir_sys_desact = false\nev_sys_desact / ir_sys_desact = true"
          }
        },
        "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
        "z": 141,
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "position": {
          "x": 347,
          "y": -416
        },
        "size": {
          "width": 159,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_WATING",
            "fontSize": 11
          },
          "specification": {
            "text": "every 1s [timer_stop > 0] / timer_stop -= 1"
          }
        },
        "id": "e7b36c29-6905-49f8-a098-8b1582cd3ba5",
        "z": 145,
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7b36c29-6905-49f8-a098-8b1582cd3ba5"
        },
        "target": {
          "id": "3e16c367-db0e-4d14-ae4b-e514854ca829",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "13.924%",
              "dy": "92.063%",
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
                "text": "[timer_stop == 0 && ir_barrier_free]"
              }
            },
            "position": {
              "distance": 0.2901857004956815,
              "offset": 19.10150146484375,
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
        "id": "6c0ead49-7f68-459b-a7b0-21f205a0a630",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 191,
            "y": -386
          }
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63"
        },
        "target": {
          "id": "3e16c367-db0e-4d14-ae4b-e514854ca829",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.836%",
              "dy": "53.361%",
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
                "text": "ev_activate [!ir_sys_desact] \n/ person_count = 0"
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
        "id": "d880c762-0d3a-455d-a110-5a4b7c2082e1",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3e16c367-db0e-4d14-ae4b-e514854ca829"
        },
        "target": {
          "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.881%",
              "dy": "90%",
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
                "text": "ev_sys_desact \n/ ir_sys_desact = true"
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
        "id": "d45be140-40c0-4fe7-9eda-4a4fa27b7b8c",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f"
        },
        "target": {
          "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "46.61%",
              "dy": "98.333%",
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
                "text": "ev_sys_desact / ir_sys_desact = true"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "48d1ed8f-c7ba-40c0-9d9c-86008e7931ea",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "10.508%",
              "dy": "98.616%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "84.061%",
              "dy": "93.08%",
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
                "text": "ev_person_out \n[person_count >= threshold] \n/ person_count -=1"
              }
            },
            "position": {
              "distance": 0.7772090035369473,
              "offset": 28.006250957797498,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "c37c03a4-b523-4796-961d-5513b2c6c5c0",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "60c37107-df43-4d22-88d4-45c575a4482f"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "87.213%",
              "dy": "83.392%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.261%",
              "dy": "15.278%",
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
                "text": "ev_person_in / person_count += 1"
              }
            },
            "position": {
              "distance": 0.3881460387665563,
              "offset": 48.45466556653522,
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
        "id": "e1b115a1-3b50-4ce0-9679-ccdfb1a464e3",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 753,
            "y": 84.17
          }
        ],
        "parent": "60c37107-df43-4d22-88d4-45c575a4482f"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7b36c29-6905-49f8-a098-8b1582cd3ba5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "90.566%",
              "dy": "5%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.065%",
              "dy": "3.846%",
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
                "text": "ev_person_in\n/ person_count = 1"
              }
            },
            "position": {
              "distance": 0.21024591998582942,
              "offset": -54,
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
        "id": "ebbc25a7-7484-475e-b125-e177999dcd0a",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 491,
            "y": -292
          }
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f"
        },
        "target": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "38.211%",
              "dy": "94.872%",
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
                "text": "ev_person_out \n[person_count < threshold]"
              }
            },
            "position": {
              "distance": 0.22522905552187444,
              "offset": -76,
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
        "id": "ed0d1f03-adb7-4c53-a474-410f5fff24b3",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3e16c367-db0e-4d14-ae4b-e514854ca829"
        },
        "target": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.814%",
              "dy": "20%",
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
                "text": "ev_person_in / person_count = 1"
              }
            },
            "position": {
              "distance": 0.3429003021148036,
              "offset": -14.999993896484371,
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
        "id": "c61af43e-669b-434b-9053-6fbb07e9041d",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.439%",
              "dy": "48.718%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "3e16c367-db0e-4d14-ae4b-e514854ca829",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.671%",
              "dy": "55.556%",
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
                "text": "ev_person_out [person_count == 0]"
              }
            },
            "position": {
              "distance": 0.6299093655589124,
              "offset": -9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "ce134f8e-8f83-449e-a2f6-15726c71fc4f",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1"
        },
        "target": {
          "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.881%",
              "dy": "81.667%",
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
                "text": "ev_sys_desact / ir_sys_desact = true"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "6"
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
        "id": "99d3d0ef-b7d8-46e9-8c28-9b2c5d62f21f",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 400,
            "y": -58
          },
          {
            "x": 5,
            "y": -58
          }
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "95.935%",
              "dy": "2.564%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "e7b36c29-6905-49f8-a098-8b1582cd3ba5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "57.233%",
              "dy": "8.333%",
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
                "text": "[person_count == 0] / timer_stop = wait_time_cfg"
              }
            },
            "position": {
              "distance": 0.598676125970532,
              "offset": 21.210784912109375,
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
        "id": "bf2cf8e7-ede1-4727-8d36-4d92c8710aae",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 586,
            "y": -411
          }
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "79.675%",
              "dy": "93.59%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "60c37107-df43-4d22-88d4-45c575a4482f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "73.043%",
              "dy": "8.333%",
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
                "text": "ev_person_in \n[person_count >= threshold]"
              }
            },
            "position": {
              "distance": 0.7935794645181581,
              "offset": -77,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "5"
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
        "id": "45a2cc7d-35cb-4e6a-b540-9bce2eb79bae",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "90.698%",
              "dy": "90%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.268%",
              "dy": "20%",
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
                "text": "ev_person_out [person_count > 0] \n/ person_count -=1"
              }
            },
            "position": {
              "distance": 0.5010118010321467,
              "offset": 93.18035888671875,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "d1d73ff8-5a2a-43eb-8240-13e171e7e04e",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 738,
            "y": -157
          }
        ],
        "parent": "9e1f5949-1d50-49b9-b2d8-082da1507fa1"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.977%",
              "dy": "3.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "9e1f5949-1d50-49b9-b2d8-082da1507fa1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "87.209%",
              "dy": "6.667%",
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
                "text": "ev_person_in \n[person_count < threshold] \n/ person_count += 1"
              }
            },
            "position": {
              "distance": 0.34383039250797137,
              "offset": -16,
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
        "id": "8439780c-6585-4b75-a595-56442032d704",
        "z": 158,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "9e1f5949-1d50-49b9-b2d8-082da1507fa1"
      },
      {
        "position": {
          "x": -362,
          "y": -213
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "5aacae27-9d2a-41bf-b290-cf5cfb25148d",
        "z": 159,
        "embeds": [
          "9bd72f44-a7cd-4494-ae38-0bb2748ea320"
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -362,
          "y": -198
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "9bd72f44-a7cd-4494-ae38-0bb2748ea320",
        "z": 160,
        "parent": "5aacae27-9d2a-41bf-b290-cf5cfb25148d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5aacae27-9d2a-41bf-b290-cf5cfb25148d"
        },
        "target": {
          "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.607%",
              "dy": "60.748%",
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
        "id": "ca95940c-60fd-42a4-b96d-0e1d48bb0643",
        "z": 161,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7b36c29-6905-49f8-a098-8b1582cd3ba5"
        },
        "target": {
          "id": "614a0af3-1b91-4d68-821e-17d0f0b0dd63",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.315%",
              "dy": "21.667%",
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
                "text": "ev_sys_desact / ir_sys_desact = true"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "f71cb9db-eda6-4e8d-a40b-433f48656907",
        "z": 162,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -11,
            "y": -456
          }
        ],
        "parent": "dc75e984-6c6c-4ede-9a0d-7b84771b740b"
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
          "moduleName": "TaskNormal",
          "statemachinePrefix": "taskNormal",
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