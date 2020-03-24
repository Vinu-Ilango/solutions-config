{
  "branding": {
    "browser_title": "EnerGov Executive Insights",
    "title": "EnerGov Executive Insights"
  },
    "exploration_card_entries": [
    {
      "name": "Growth Management Plan",
      "link": "https://cityofsfgis.maps.arcgis.com/apps/webappviewer/index.html?id=eecb42437c0042ebb30ecc65e38c6bef",
      "image": "https://www.tylertech.com/Portals/0/Images/Products/CLT-APPRAISAL-Techniques-Prepare-Financial-Support-Download.jpg?ver=2018-09-25-174822-170?format=jpg&quality=80",
      "exploration_content": "View the 2040 comprehensive plan"
    }],
  "tag_list": [
    "Permitting",
    "Planning",
    "Business Services",
    "Code Enforcement",
    "Inspections"
  ],
  "date": {
    "startDate": "2018-1-1",
    "endDate": "2020-01-27"
  },
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Permitting",
      "description": "Permitting",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "amhj-22i6",
      "fields": {
        "date_column": "applicationdate",
        "incident_type": "permittypegroup",
        "location": "location",
        "8t69-jvh8": ":@computed_region_8t69_jvh8"
      },
      "dimension_entries": [
        {
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "reviewer",
          "name": "Permit Reviewer"
        }
      ],
      "group_by_entries": [
        {
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "projectname",
          "name": "Project"
        },
        {
          "column": "permitstatus",
          "name": "Permit Status"
        },
        {
          "column": "reviewer",
          "name": "Permit Reviewer"
        }
      ],
      "view_entries": [
        {
          "name": "Permits Issued",
          "column": "permitid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "permits",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "fields": {
            "date_column": "issueddate"
          }
        },
        {
          "name": "Total Applications Received",
          "column": "permitid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            },
           "overtime": {
     "timeline": {
    "default_time_frame": "year_on_year"
    }
    }
          },
          "fields": {
            "date_column": "applicationdate"
          }
        },
        {
          "name": "Open Permit Applications",
          "column": "permitid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "end_date_override_and_ignore":"true",
          "start_date_boolean_override":"<",
          "parent_queries": [
            "select *,:@computed_region_8t69_jvh8 where permitstatus not in ('Finaled','Issued')"
          ],
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Permits issued Within 30 days",
          "column": "((sum(less_than_30_count)/count(*))::double)*100.00",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "permitnumber",
                    "name": "Number of Permits",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": "0",
                    "render_type": "bullet"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "name": "90%",
                    "value": "90"
                  }
                ]
              },
              "scatterplot": {
                "default_show_range": "false",
                "secondary_metric_entries": [
                  {
                    "column": "permitnumber",
                    "name": "Number of Permits",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  }
                ]
            }
          }},
          "fields": {
            "date_column": "applicationdate"
          },
          "parent_queries": [
            "select *, :@computed_region_8t69_jvh8,case(applied_to_issued < 30, 1) as less_than_30_count where isstatusissued='true'"
          ],
          "target_entries": [
            {
              "name": "SLA Met",
              "color": "#259652",
              "operator": ">",
              "value": "90",
              "icon": "icons-check-circle",
              "target_entry_description": "The SLA for this operating metric is being met. The SLA is 90% of permits issued within 30 days."
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "The SLA for this operating metric is not being met. The SLA is 90% of permits issued within 30 days."
            }
          ]
        },
        {
          "name": "Average # Days from Application to Issuance",
          "column": "avg(applied_to_issued)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "SLA Met",
              "color": "#259652",
              "operator": "<",
              "value": "120",
              "icon": "icons-check-circle"
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total Estimated Value of Permitted Construction",
          "column": "sum(permitvaluation)",
          "aggregate_type": "",
          "use_dimension_value": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "projectname",
          "name": "Project"
        },
        {
          "column": "permitstatus",
          "name": "Permit Status"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "district",
          "name": "District"
        }
      ],
      "map": {
        "centerLat": "43.539349",
        "centerLng": "-96.730926",
        "zoom": "10",
        "mini_map_zoom": "9",
        "shapes_outline_highlight_width": "4",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      },
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "tyler.partner.socrata.com",
          "shape_dataset_id": "8t69-jvh8",
          "shape_name": "City Council Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Inspections",
      "description": "Inspections",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "vnvd-qqjp",
      "fields": {
        "date_column": "requestdatetime",
        "incident_type": "inspectiontypename",
        "location": "location",
        "8t69-jvh8": ":@computed_region_8t69_jvh8"
      },
      "dimension_entries": [
        {
          "column": "inspectiontypename",
          "name": "Inspection"
        },
        {
          "column": "inspectionstatusname",
          "name": "Inspection Status"
        },
        {
          "column": "inspectionlinktypename",
          "name": "Inspection Link Name"
        },
        {
          "column": "balancedue",
          "name": "Balance due"
        }
      ],
      "view_entries": [
        {
          "name": "Open Inspections",
          "column": "case(isstatusindicatesuccess='False', 1, true, 0)",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Inspections"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }          }
        },
        {
          "name": "Completed Inspections",
          "column": "inspectionid",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Inspections"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "fields": {
            "date_column": "actualenddatetime"
          }
        },
        {
          "name": "Average Delay in Inspection Start Time",
          "column": "avg(actual_start_to_scheduled_start)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Inspections"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            },
          "parent_queries": [
            "select * where actual_start_to_scheduled_start is not null"
          ]
          },
          "fields": {
            "date_column": "actualenddatetime"
          },
          "target_entries": [
            {
              "name": "SLA Met",
              "color": "#259652",
              "operator": "<",
              "value": "10",
              "icon": "icons-check-circle"
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "inspectiontypename",
          "name": "Inspection"
        },
        {
          "column": "inspectionstatusname",
          "name": "Inspection Status"
        },
        {
          "column": "inspectionlinktypename",
          "name": "Inspection Link Name"
        },
        {
          "column": "balancedue",
          "name": "Balance due"
        }
      ],
      "map": {
        "centerLat": "43.0481",
        "centerLng": "-76.1474",
        "zoom": "11",
        "mini_map_zoom": "11",
        "shapes_outline_highlight_width": "4",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      },
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "tyler.partner.socrata.com",
          "shape_dataset_id": "8t69-jvh8",
          "shape_name": "City Council Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Business Services",
      "description": "Business Services",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "sb4f-xivi",
      "fields": {
        "date_column": "applicationdate",
        "incident_type": "doingbusinessas",
        "location": "location"
      },
      "dimension_entries": [
        {
          "column": "licensetype",
          "name": "License Type"
        },
        {
          "column": "doingbusinessas",
          "name": "Business"
        },
        {
          "column": "licensestatus",
          "name": "License Status"
        },
        {
          "column": "licenseclass",
          "name": "License Class"
        }
      ],
      "group_by_entries": [
        {
          "column": "district",
          "name": "District"
        },
        {
          "column": "licensetype",
          "name": "License Type"
        }
      ],
      "view_entries": [
        {
          "name": "License Applications",
          "column": "licenseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Business Services"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Average Time From Application to Issuance",
          "column": "avg(applied_to_issued)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Business Services"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Business License Revenue",
          "column": "balancedue",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Business Services"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "doingbusinessas",
          "name": "Business"
        },
        {
          "column": "licensestatus",
          "name": "License Status"
        },
        {
          "column": "licenseclass",
          "name": "License Class"
        },
        {
          "column": "licensetype",
          "name": "License Type"
        },
        {
          "column": "district",
          "name": "District"
        }
      ],
      "map": {
        "centerLat": "43.539349",
        "centerLng": "-96.730926",
        "zoom": "10",
        "mini_map_zoom": "9",
        "shapes_outline_highlight_width": "4",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      }
    },
    {
      "name": "Code Cases",
      "description": "Code Cases",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "sukz-2bfa",
      "fields": {
        "date_column": "openeddate",
        "incident_type": "codecaseid",
        "location": "location",
        "8t69-jvh8": ":@computed_region_8t69_jvh8"
      },
      "dimension_entries": [
        {
          "column": "codecasetypename",
          "name": "Code Case Type"
        },
        {
          "column": "codecasestatusname",
          "name": "Code Case Status"
        },
        {
          "column": "districtname",
          "name": "District"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "group_by_entries": [
        {
          "column": "codecasetypename",
          "name": "Code Case Type"
        },
        {
          "column": "codecasestatusname",
          "name": "Code Case Status"
        },
        {
          "column": "districtname",
          "name": "District"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "days_open",
          "name": "Days Open",
          "renderType": "number"
        }
      ],
      "view_entries": [
        {
          "name": "New Cases Opened",
          "column": "codecaseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Code Enforcement"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Open Cases",
          "column": "codecaseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "end_date_override_and_ignore":"true",
          "start_date_boolean_override":"<",
          "parent_queries": [
            "select *,:@computed_region_8t69_jvh8 where codecasestatusname not in ('Closed')"
          ],
          "tags": [
            "Code Enforcement"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Average Time Open",
          "column": "opened_to_closed",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Code Enforcement"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Outstanding Balance Due",
          "column": "balancedue",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Code Enforcement"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "codecasetypename",
          "name": "Code Case Type"
        },
        {
          "column": "codecasestatusname",
          "name": "Code Case Status"
        },
        {
          "column": "districtname",
          "name": "District"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "map": {
        "centerLat": "43.539349",
        "centerLng": "-96.730926",
        "zoom": "10",
        "mini_map_zoom": "9",
        "shapes_outline_highlight_width": "4",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      },
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "tyler.partner.socrata.com",
          "shape_dataset_id": "8t69-jvh8",
          "shape_name": "City Council Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Plans",
      "description": "Planning",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "akmz-6gsk",
      "fields": {
        "date_column": "applicationdate",
        "incident_type": "planid"
      },
      "dimension_entries": [
        {
          "column": "plantype",
          "name": "Plan Type"
        }
      ],
      "group_by_entries": [
        {
          "column": "plantype",
          "name": "Plan Type"
        }
      ],
      "quick_filter_entries": [
        
      ],
      "view_entries": [
        {
          "name": "Plan Applications Opened",
          "column": "applicationdate",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Planning"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Average Time Open",
          "column": "applied_to_completed",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Planning"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "codecasetypename",
          "name": "Code Case Type"
        },
        {
          "column": "codecasestatusname",
          "name": "Code Case Status"
        },
        {
          "column": "districtname",
          "name": "District"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "map": {
        "centerLat": "43.539349",
        "centerLng": "-96.730926",
        "zoom": "10",
        "mini_map_zoom": "9",
        "shapes_outline_highlight_width": "4",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      },
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "tyler.partner.socrata.com",
          "shape_dataset_id": "8t69-jvh8",
          "shape_name": "City Council Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    }
  ]
}
