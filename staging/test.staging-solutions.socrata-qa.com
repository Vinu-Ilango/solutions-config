{
  "application_use": "demo",
  "is_private": "true",
  "solutions_app_users": ["*@elumitas.com"],
  "branding": {
    "browser_title": "Test Solutions Staging",
    "title": "Solutions - Test"
  },
  "tag_list": [
    "Cases",
    "Judges",
    "Clearence rates",
    "Districts and counties"
  ],
  "show_share_via_email": "false",
  "date": {
    "startDate": "2019-10-01",
    "endDate": "2019-12-31"
  },
  "street_view_map_key": "AIzaSyB17sR2sKWfEcfsXwq_EKH4_J4DKuZ3y6I",
  "date_options": {
    "type": "yearly",
    "year_start_month": "4",
    "data_end_date": "2019-02-10"
  },
  "template_entries": [
    {
      "name": "Opex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {},
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "category",
          "name": "Category"
        }
      ],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "default_comparison_column_entry": "program",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "department",
                    "name": "Department",
                    "aggregate_type": "count",
                    "render_type": "bar",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "departments"
                  },
                  {
                    "column": "program",
                    "name": "Program",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": ""
                  },
                  {
                    "column": "category",
                    "name": "Category",
                    "aggregate_type": "count",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "categories"
                  }
                ],
                "default_secondary_metric": "Program",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "4000",
                    "value1": "5000"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "2500",
                    "value1": "3500"
                  },
                  {
                    "dimension_column": "department",
                    "name": "Department",
                    "value": "1100",
                    "value1": "1400"
                  },
                  {
                    "column": "category",
                    "name": "Category",
                    "aggregate_type": "count"
                  }
                ],
                "default_bench_mark": "Department"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "department",
                    "name": "Department",
                    "aggregate_type": "count",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "departments"
                  },
                  {
                    "column": "category",
                    "name": "Category",
                    "aggregate_type": "count",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "categories"
                  }
                ],
                "default_secondary_metric": "Category",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "4000",
                    "value1": "5000"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "2500",
                    "value1": "3500"
                  },
                  {
                    "dimension_column": "department",
                    "name": "Department",
                    "value": "1100",
                    "value1": "1400"
                  },
                  {
                    "column": "category",
                    "name": "Category",
                    "aggregate_type": "avg"
                  }
                ],
                "default_bench_mark": "Department"
              }
            }
          },
          "precision": "0",
          "prefix": "",
          "suffix": "funds",
          "tags": [
            "Cases",
            "Clearence rates"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total amount spent",
          "primary_metric_name": "Current amount",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "suffix": "Total",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "show_pie_chart": "true",
              "default_comparison_column_entry": "approved_amount",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "approved_amount",
                    "name": "Approved Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Approved",
                    "independent_axes_values": "true"
                  },
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  }
                ],
                "default_secondary_metric": "Approved Amount",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "200000000"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "200000000",
                    "value1": "300000000"
                  }
                ],
                "default_bench_mark": "Bench mark 1"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "approved_amount",
                    "name": "Approved Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Approved"
                  },
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  }
                ],
                "default_secondary_metric": "Approved Amount",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "200000000"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "200000000",
                    "value1": "300000000"
                  }
                ],
                "default_bench_mark": "Bench mark 1"
              }
            }
          },
          "quick_filters": [
            {
              "column": "program",
              "type": "text",
              "field": "quick_filter_0_s8xp_hq5q_2",
              "values": [
                "a"
              ],
              "operator": "like"
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Amount spent on Salary And Wages",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "default_view": "piechart"
            }
          },
          "quick_filters": [
            {
              "column": "category",
              "type": "text",
              "field": "quick_filter_0_s8xp_hq5q_4",
              "values": [
                "Salary and Wages"
              ],
              "operator": "="
            }
          ]
        },
        {
          "name": "Total amount approved",
          "column": "approved_amount",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot"
            }
          },
          "prefix": "$",
          "precision": "2"
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "fiscal_year",
          "name": "Year"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "category",
          "name": "Category"
        },
        {
          "column": "fiscal_year",
          "name": "Year"
        },
        {
          "column": "description",
          "name": "Description"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "service",
          "name": "Service",
          "renderType": "text"
        },
        {
          "column": "department",
          "name": "Department",
          "renderType": "text"
        },
        {
          "column": "program",
          "name": "Program",
          "renderType": "text"
        },
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "text"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        },
        {
          "column": "fiscal_year",
          "name": "Year",
          "renderType": "number"
        }
      ],
      "map": {
        "centerLat": "38.760910",
        "centerLng": "-121.302611",
        "zoom": "10",
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
      "shape_datasets": [
        {
          "shape_dataset_domain": "tylertech.demo.socrata.com",
          "shape_name": "Elgin Police Beats",
          "dataset_id": "r52y-uc86",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id"
          },
          "color": "#ffff66"
        }
      ],
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "Beats",
          "shape_outline_dataset_id": "ujv7-87d7",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#d73b70",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "Parks & Recreation",
          "shape_outline_dataset_id": "pn3p-r56a",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#0b19b3",
          "show_by_default": "false"
        },
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "City Boundary",
          "shape_outline_dataset_id": "79cn-t7i2",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#299c0c",
          "show_by_default": "false"
        }
      ]
    },
    {
      "name": "Opex Revenue",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "mik7-qbhe",
      "fields": {},
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "source",
          "name": "Source"
        }
      ],
      "view_entries": [
        {
          "name": "Total Revenue",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "render_type": "parallel",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended",
                    "independent_axes_values": "true"
                  },
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual",
                    "independent_axes_values": "false"
                  }
                ],
                "default_secondary_metric": "Recommended Amount"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  },
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ],
                "default_secondary_metric": "Actual Amount"
              }
            }
          },
          "tags": [
            "Cases",
            "Judges"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total Projections",
          "column": "projected_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "dollar",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot"
            }
          },
          "precision": "2"
        }
      ],
      "map": {
        "centerLat": "42.038333",
        "centerLng": "-88.322778",
        "zoom": "10",
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
      "name": "Capex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "dszp-jd2s",
      "fields": {},
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "project",
          "name": "Project"
        }
      ],
      "view_entries": [
        {
          "column": "approved_amount",
          "name": "Approved Amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "piechart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ]
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ]
              }
            },
            "tags": [
              "Cases",
              "Clearence rates"
            ]
          }
        },
        {
          "column": "actual_amount",
          "name": "Actual Amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "piechart"
            }
          },
          "tags": [
            "Cases",
            "Judges"
          ]
        }
      ],
      "map": {
        "centerLat": "38.760910",
        "centerLng": "-121.302611",
        "zoom": "10",
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
      "name": "Payroll",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "qu7r-i9cv",
      "fields": {},
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "position_title",
          "name": "Job"
        },
        {
          "column": "position_type",
          "name": "Position Type"
        }
      ],
      "view_entries": [
        {
          "name": "Annual Total",
          "column": "pay_total",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot"
            }
          }
        }
      ],
      "map": {
        "centerLat": "42.038333",
        "centerLng": "-88.322778",
        "zoom": "10",
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
      "name": "Cobb-Dekalb-Fulton",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3hre-b49k",
      "fields": {
        "date_column": "tax_year",
        "incident_type": "class",
        "location": "geocoded_column",
        "73f8-h8ah": ":@computed_region_73f8_h8ah"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "group_by_entries": [
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "year_built_1",
          "name": "Year"
        }
      ],
      "view_entries": [
        {
          "name": "Mean ratio",
          "column": "(market_total/case(sale_price == 0,1, true, sale_price))",
          "aggregate_type": "avg",
          "precision": "2",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
              "default_view": "point"
            },
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "==",
              "value": "30000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Sales",
          "column": "sale_type",
          "aggregate_type": "count",
          "stacked_column": "sale_type",
          "precision": "",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
              "default_view": "choropleth"
            },
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Building value",
          "column": "building_value",
          "aggregate_type": "sum",
          "precision": "2",
          "prefix": "$",
          "visualization": {
            "default_view": "snapshot",
            "overtime": {
              "timeline": {
                "show_total": "true",
                "show_dimensions": "true",
                "default_show_projection": "true",
                "default_compare_year": "2015",
                "default_time_frame": "year_on_year",
                "show_range_slider": "false"
              }
            },
            "snapshot": {
              "chart_type": "groupChart",
              "default_view": "scatterplot"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "year_built_1",
          "name": "Year"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "sale_date",
          "name": "Sales date",
          "renderType": "date"
        }
      ],
      "map": {
        "centerLat": "32.20410409773211",
        "centerLng": "-82.38302461163329",
        "zoom": "5",
        "mini_map_zoom": "4",
        "shapes_outline_highlight_width": "4",
        "show_geocoder_control": false,
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "73f8-h8ah",
          "shape_name": "State of Georgia",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "name"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Incidents Data",
      "dataset_domain": "pinellasparkpd.data.socrata.com",
      "dataset_id": "qs3a-3222",
      "fields": {
        "date_column": "reported_date_time",
        "incident_type": "occurred_incident_type",
        "location": "location",
        "hmbv-vp9r": ":@computed_region_hmbv_vp9r",
        "ntia-f3vs": ":@computed_region_ntia_f3vs",
        "xx7z-z9ah": ":@computed_region_xx7z_z9ah",
        "f3c4-j5m5": ":@computed_region_f3c4_j5m5"
      },
      "dimension_entries": [
        {
          "column": "case_disposition",
          "name": "Disposition"
        },
        {
          "column": "reporting_officer_full_name",
          "name": "Officer"
        },
        {
          "column": "status",
          "name": "Status"
        },
        {
          "column": "assigned_bureau",
          "name": "Assigned Bureau"
        }
      ],
      "group_by_entries": [
        {
          "column": "assigned_bureau",
          "name": "Assigned bureau"
        },
        {
          "column": "agency_name",
          "name": "Agency"
        }
      ],
      "view_entries": [
        {
          "name": "Incidents",
          "column": "occurred_incident_type",
          "aggregate_type": "count",
          "precision": "",
          "prefix": "",
          "suffix": "incidents",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "showCompareDropDown": "true",
              "default_group_by_entry_column": "agency_name",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "status",
                    "name": "Status",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  },
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "render_type": "bar",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "render_type": "bullet",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases Count",
                    "aggregate_type": "count",
                    "render_type": "parallel",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Cases Count",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "400",
                    "value1": "500"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "250",
                    "value1": "350"
                  },
                  {
                    "dimension_column": "case_disposition",
                    "name": "Disposition",
                    "value": "1100",
                    "value1": "1400"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "avg"
                  }
                ],
                "default_bench_mark": "Disposition"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Status",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "1400",
                    "value1": "1800"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "1250",
                    "value1": "1350"
                  },
                  {
                    "dimension_column": "case_disposition",
                    "name": "Disposition",
                    "value": "1100",
                    "value1": "1400"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count"
                  }
                ],
                "default_bench_mark": "Disposition"
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true",
              "default_view": "timeline",
              "timeline": {
                "show_total": "true",
                "show_dimensions": "true",
                "default_show_projection": "true",
                "default_compare_year": "2015",
                "default_time_frame": "year_on_year",
                "show_range_slider": "true",
                "secondary_metric_entries": [
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Case Disposition",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "1400",
                    "value1": "1500"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "1250",
                    "value1": "1350"
                  },
                  {
                    "dimension_column": "case_disposition",
                    "name": "Disposition",
                    "value": "1100",
                    "value1": "1400"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count"
                  }
                ],
                "default_bench_mark": "Disposition"
              },
              "burn_up": {
                "show_total": "true",
                "show_dimensions": "false",
                "default_show_projection": "false",
                "default_compare_year": "",
                "default_time_frame": "rolling",
                "show_range_slider": "false",
                "secondary_metric_entries": [
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Cases",
                "bench_mark_entries": [
                  {
                    "name": "Bench mark 1",
                    "value": "400",
                    "value1": "500"
                  },
                  {
                    "name": "Bench mark 2",
                    "value": "250",
                    "value1": "350"
                  },
                  {
                    "dimension_column": "case_disposition",
                    "name": "Disposition",
                    "value": "1100",
                    "value1": "1400"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count"
                  }
                ],
                "default_bench_mark": "Disposition"
              }
            }
          },
          "quick_filters": [
            {
              "type": "date",
              "column": "reported_date_time",
              "field": "quick_filter_5_qs3a_3222_0",
              "dateRange": {
                "start_date": "2018-10-01",
                "end_date": "2018-12-30"
              }
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "1000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        }
      ],
      "filter_by_entries": [
        {
          "column": "status",
          "name": "Status"
        },
        {
          "column": "occurred_incident_type",
          "name": "Incident Type"
        },
        {
          "column": "block",
          "name": "Block"
        },
        {
          "column": "case_arrest_made",
          "name": "Case Arrest Made"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "assigned_bureau",
          "name": "Assigned bureau"
        },
        {
          "column": "agency",
          "name": "Agency"
        },
        {
          "column": "reporting_officer_rank",
          "name": "Officer Rank"
        },
        {
          "column": "reporting_officer_full_name",
          "name": "Officer Name"
        },
        {
          "column": "reported_date_time",
          "name": "Reported Date"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "reported_date_time",
          "name": "Reported Date",
          "renderType": "date"
        }
      ],
      "map": {
        "centerLat": "27.857590",
        "centerLng": "-82.711240",
        "zoom": "12",
        "shapes_outline_highlight_width": "4",
        "show_geocoder_control": true,
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
          "shape_dataset_domain": "pinellasparkpd.data.socrata.com",
          "shape_dataset_id": "hmbv-vp9r",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id",
            "shape_name": "zone",
            "shape_description": "zone"
          },
          "color": "#0a4747",
          "shape_name": "Zones"
        },
        {
          "shape_dataset_domain": "pinellasparkpd.data.socrata.com",
          "shape_dataset_id": "xx7z-z9ah",
          "fields": {
            "shape": "polygon",
            "shape_id": "_feature_id",
            "shape_name": "objectid",
            "shape_description": "objectid"
          },
          "color": "#d93909",
          "shape_name": "Us Hwy 19 Buffer"
        }
      ],
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "Districts",
          "shape_outline_dataset_id": "gmha-2akv",
          "fields": {
            "shape": "multipolygon"
          },
          "color": "#d73b70",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "Neighborhood12",
          "shape_outline_dataset_id": "2wve-f3n7",
          "fields": {
            "shape": "polygon"
          },
          "color": "#147053",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "UsHwy19Buffer",
          "shape_outline_dataset_id": "nhej-vwqe",
          "fields": {
            "shape": "polygon"
          },
          "color": "#750b6e",
          "show_by_default": "false"
        }
      ]
    },
    {
      "name": "Clermont County Property Data",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "rf3x-u64k",
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "5ynq-aczk": ":@computed_region_5ynq_aczk"
      },
      "dimension_entries": [
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Taxdist"
        },
        {
          "column": "cityname",
          "name": "City"
        }
      ],
      "group_by_entries": [
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Taxdist"
        }
      ],
      "view_entries": [
        {
          "name": "Mean Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price)",
          "aggregate_type": "avg",
          "precision": "2",
          "visualization": {
            "default_view": "map",
            "map": {
              "default_view": "heat"
            },
            "snapshot": {
              "chart_type": "groupChart",
              "show_scatterplot_range_bar": "true",
              "scatterplot": {
                "default_show_range": "true"
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "9",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Median Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, mktval) , true, price)",
          "aggregate_type": "median",
          "precision": "2",
          "visualization": {
            "default_view": "map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Estimated Total Market Value",
          "column": "estimated_total_market_value",
          "aggregate_type": "sum",
          "precision": "2",
          "prefix": "$",
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true",
              "default_view": "timeline",
              "burn_up": {
                "show_total": "true",
                "show_dimensions": "true",
                "default_show_projection": "true",
                "default_compare_year": "2017",
                "default_time_frame": "year_on_year"
              },
              "timeline": {
                "show_total": "true",
                "show_dimensions": "true",
                "default_show_projection": "true",
                "default_compare_year": "2017",
                "default_time_frame": "year_on_year"
              }
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "tax_year",
          "name": "Tax Year"
        },
        {
          "column": "style",
          "name": "style"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "address",
          "name": "Address"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "estimated_total_market_value",
          "name": "Estimated Total Market Value"
        },
        {
          "column": "tax_year",
          "name": "Tax Year"
        }
      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "5ynq-aczk",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "townname",
            "shape_description": "label"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Parcels",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "rf3x-u64k",
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "5ynq-aczk": ":@computed_region_5ynq_aczk"
      },
      "parent_queries": [
        "select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median"
      ],
      "dimension_entries": [
        {
          "column": "style",
          "name": "Syle"
        },
        {
          "column": "grade",
          "name": "Grade"
        }
      ],
      "group_by_entries": [
        {
          "column": "nbhd",
          "name": "Neighbourhood"
        }
      ],
      "view_entries": [
        {
          "name": "Average Absolute Deviation",
          "column": "asr_deviation_from_median",
          "aggregate_type": "avg",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(asr_deviation_from_median)/avg(median_asr)",
          "aggregate_type": "",
          "precision": "2",
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true",
              "default_view": "area"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "30000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(estimated_total_market_value)/sum(price)    )",
          "aggregate_type": "",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "default_view": "scatterplot",
              "show_scatterplot_range_bar": "true",
              "scatterplot": {
                "default_show_range": "true"
              }
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "tax_year",
          "name": "Tax Year"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "estimated_market_land_value",
          "name": "Estimated Market Land Value"
        },
        {
          "column": "stories",
          "name": "Stories"
        },
        {
          "column": "attic",
          "name": "Attic"
        },
        {
          "column": "extwall",
          "name": "Exterior Wall"
        }
      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "5ynq-aczk",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "townname",
            "shape_description": "label"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "ERP metrics",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {},
      "parent_queries": [
        "select * where service = 'Education'"
      ],
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "group_by_entries": [],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "table"
          },
          "precision": "",
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "==",
              "value": "833",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "quick_filters": [
            {
              "type": "text",
              "column": "program",
              "field": "quick_filter_8_s8xp_hq5q_1",
              "values": [
                "Athletics"
              ],
              "operator": "="
            }
          ]
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "category",
          "name": "Category"
        },
        {
          "column": "department",
          "name": "Department"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "text"
        },
        {
          "column": "program",
          "name": "Program",
          "renderType": "text"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        },
        {
          "column": "department",
          "name": "Department",
          "renderType": "text"
        }
      ],
      "map": {},
      "shape_datasets": [],
      "shape_outline_dataset_entries": []
    }
  ],
  "exploration_card_entries": [
    {
      "name": "1 Opex Budget",
      "link": "google.com",
      "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWAAAACPCAMAAADz2vGdAAAAn1BMVEX///8yMDIwLS8uKy0AAAApJicyLzEoJSYsKSo1MzUvLS4uLC0qJigmIiMmIyQkICHs7Oz39/fl5eXo6OjFxcUhHSDx8fHc3NweGhvS0tLa2tr5+fmXlpe/v7+Pjo8IAAAXEhSqqaqDgoM/PT6wr7AaFxpiYWJvbm5LSUvLysu2traenZ2Qj5B6eXo8OjsLAAhbWVpycXJcWltHRUdST1CDdih8AAAZwklEQVR4nO1diZqqPLZFiAJVSBCJgjIENKBQitP7P9tNwAEVVJz/03d19+lPpDBskpU9w3EfhpHYthvK8zAYT3ufHsw/BytRUVOSBEFoqosgsfwwmoWfHtS/Al3j3FRsyBSNVZCMbVlEKhW11/n0yP4RzDYWzsRLBdySFFVpydlHNP30yP4RhApqlIGf5993Pzu8/yo0e6Gm6ch3gnLxUqCEnuekGCSfHux/ERERWq0Wj5DSqkKDONpfyhOz/+nB/ufgzJfNSrkewJtYFXD86dH+BwEl5Yfn+RZ/hJOP2WdR1j492C/D8PoZvo34G6FO3jDk/wbibCUvAQAT5/KZgQd/boS0fsfQvxz9KZ20PgAR+6AZfScFHU6exXrZyUYQyKj5eytg8N57OUbH+rzJPg1T4MmWRqU5dHYKK2MJH4IyQ6FjjYEaYoIxaTPD+Ap+yewVo2ZyizdW5fc6syE1X0J41bN837E+psa4CEySgFBeCPpL0LDBMAQMPv2uOwaR1ut1hie8bADLGk+n/pJgeFXC6bNvzUlmo2yIoNTV0et3O+M5xht3hUVqTf4QpIoQEVC+1VrzkbuZ+Vc48UFo1joO2Ig9jDE3p1QczTqc5Rlchx1G2d3My/5yusTSFeAnDzaigk1ix4mTMqGMFykhRKWGekvi5QKEZfnl+n4SKirYvMio/1M2I3lNsK1xSWJYRjDShwP2RYetwcRmlDGNs89DbVA2F13zknRN+mSeOd6ejcGsQKv9wzah61rXl9GRVAtQHccxrOz06dgOXONwER1H1xWnO0Eye5Y+XzyZGr5r9wmiS4lOEgysDvjZ+NyfhIDuCAQR+t+1cXaFKUZVIm42TbenPVEJ7s0ASQfFHwep2+EcrhfEXAg8orYqxMskjCBCWPaTOVEVSVQOV7GbfBpMjfG4vu/vCrV3QlltqtggzAsGVUUg8agxosf1PgCUHxgPA1mGA1fausrQPDlx3HSBa2OlFFLryRvcBOA2Png1hn4qyzhxFM7HeDbQArVavDu0VCV3+2F6AVvT+4YbsNuXEJV/atcaTlePGySUnU5PH/SrHo4/djQuTne/31jL/MihWltCOakPqLBtD6GUybchK+xfBa8Df1q4XBDbCW6WAI85DOr60Sz/7y8ZG/3yNdu3AWjvP8lMMnjoYFuW6BpccZsqfigBvxnP6aokSJH2xxoqnC1XMiKT85V6BlfNuJ5vQEwvQzAaLcLEiX26Yn3bmQbeerYZbGa2a1OKdQoj41UMbE4fjzkubFIrV3MM9jWcEz8l2TAENXUPPzSgLDtql0xgEUROrSkxtTfYVJuKqCKCR0m5Bps9sYFj0Eesr5qyTOhqWyXRLx2hs27cLmD5Ry05uyEJP8zNikMrToLZLEg6lHsCKgLnSOaB3RDP/rYlNBFUgT8jTYQEKice8YIkKYgsnHD/Y3yY+GxHdamtEavCxkcDro9kmF8fiYQ9i0bB/NWWcgDFY9m2TYIBtsellkqFdFepqfAHR2ernYa+1c1mcs8OcrnSoRhOQm0iyqbz5ZRb8Y120qcGUY9tJrBV5TWtDwGhtsKEs05QS0EUpFUcbRKlSsWTawpnh/jCw1SNwdQa9Ptu2u9R6m2IMA7ShtwATCkaA78XMQkLE7y30DqSKR4DjyLXrzYCytAHwtlN0keP00bQ5yyAqZKThBjL9E4hhpkzX0FYaPBApxtz4krPk+0xeGUn8kVxvHSHsqskfAVq9rjoFEckZydRGY2QEDBLb2oMo/z5IEmZ23E2v2JQFC7xqCJVHMpNGtBg57KnO/1e0hs6DIJn9EfRwiWqev4IGvyo08WNhtp8lXwLP3VYtfEao4Yd37Cn3ihyv587dONYX+XUo8YugWDLxAS3d6DCjZOj6IUG0sBJ3JF8iY7H3tZ9PBrHRiRsXcmT3mA64IJ5OpvzFT59xV7iG7zSz4BwMAV7I2wiHKwvKIU3o6UiYKwxWFNeHlKrIc11TcWlS2SnA/aXZlvNwAyWU4xSwIYD5Gr5zvBuGdJZ4ig7KsVWL+E6gG9cWP/Ky7jhBEJYjBp0+9OBLtfZUyvAi75hcNHI0RC1yGJ9qOkJVRkbMgSFXdUC+fyFoCR00TMc+mCSSntDG9MtIINKcNfakMJNYapIvUmA1yCujucEYVJ4GGiU6UpDTkv0bL5qzEvlT/l05W4KPxcAk8lXNMrFqF/weoUeynWHFrEdzt7tdS2Rqkt0KreeqBncDhWrVOna/zQPMV6ERWeMpMqNvXwbdK9qECIpNdTwHPjAmz2qpVIlApM0ohrTUB8eb159OQXQrO9bnwJpx3GZa9SFLYlqeVJLdgX+TeR6Bp5adAlWlnMW82q1JDL3Ty1iK1XmO4ZojKjNIfQHM3tCCbSOkMnpxHOZYiKQdM0m6slvBgPvjti8hfezhpfZnpl6YRD8RZDqRCpfOrteCF5kPwlVyn5T329gOG+Q1AzPzTq5P110Iqw2f9g0pAbS7pR+MvHgrdTRONuW3Gb2RYvN1Bk4Ff+gnuabA9ApQvLwtMrWoJ4b4Q0Jj4T3zVnoMUet1wxkAr1Mwe9FxLxiJjl68hfxDWF5vJg7jnQrrSH/+Cf0yVbpVqJpgFq4hp12MjR7bwaHGAJrxpQwKSf1v5FsYsy3+PfJl6dLb9jTtF42NMZUTugpyL9+I/qEYN5cnByd4pslzJ8QwWK7BQmIirqF7vNERiFRDzqI/2dwU0Jv08t8z+NeqPDvZV8pPXW2TzB94vAq4cUbwDu99ZkzubORxFtJCeOGX3CIxUc5UsIF1fYCXGoakAOvdcMRB6iezOZBF5hYujVe/RyI6eR0noRZyBxfdvUOfYzCceU9Niuzyc4A6YV8h7ncxo56/JW0mQ2qfqISg0GIRTHaf17iCRf4VjYNkpuzLZ4FNDsjuj6gx38QuXAPXWqgBpe2nCSd1lHgBZXFObj52d/wzbOt7gp0G4CpE6l47/C0EbZ0epfTmWsE6pvlq0T9synSYwIus0kPSK/d5hjYvldDwo1G88/nbPX8eKvh12JiOxVMm9NHopdT19gdywLdwOluoUKivpceKJrpMgKh81fk0Zn6A8o97pbvsAySyfX9LwbcFNXaCrDPWeT8MN8uM48vCBhj0I9BWxQx08oWGCKB3aj0+3bZbiGKvNokRaIY4Kp7spJxjenkii14036dnzSaTYpni9leD0d2vTqMBNtDzvY8QAXt2Gv4ZkooB/H5YvgkTu/R6M/xB4gzgdcJGE8y7uWlgmXVhPZkIRDoduL62xwVs2P5gSaZ0qdFm0GM+iAqjG79rCD+YLG27CvqhJCuutyYnFitWbQ4YURlAbSMrv7SOXTHXqk3J7i9FsSxvEL2Rv+J6Ww2GMwuOlSFqMOxKXqiP/hWCCKWUcVtCELgBpvnCP1gBAgSrye2HUPEqO6f3ISUM8DdVukVLDaTn0sC/lnPMFbXG2qpk/2JrZFqSs2AJeD1Et8J/dpTuJ9cyxuEWBEE6SBRBZN0YSXkBfKlO9r0qelHRdjoyjbHKy3VZXlJen90cmr4N3wgrwRKhUXaNqXjVWsG+rrZnFMGyz83J1OfmU0WfjY/SExj6IB7dpJbEN+gq6UspeaPS4wU421ojFoerZZieuD+zEl5P4UlQZ35qVKcVOKImc3A0iHOT0uZk61ra51VbWK5DBW+Nq/Vv0XAQ9uUIi4EtjYMmIQFvLENjOVgfP9z7wAmWqQIaoqRGnJ6u8CvSub4yZKVDYL2Al6DNH2mfBVFQLnGMN9MXzSF7etqWgMPXZWXHZBwyZzZcsKEDqo7uTPf05dHi2jmbkRJktruCIQaFxAIh9zM22cNFt10wyxBtp25BIOLmZx1gUYTkAXaen8prkg2fhizG/xqKbORpY3ujLKUBV58qChAUhUVQsTky3JXsgk0wmikUetye+di7hnubdUlF7Fzs+jV6AkSFrf/j8Mhlz/IAIZ0Mb6mrDqUrjJES4rkn5ZoR/iXfVJ/vIfKhjbq9gZVM8zob0jvLGkBMBtqKTtOgAK4frc/AQAlPa7TzQQs4UVCT4zgo/LFC5b3mT/dLQy3crQPw4bXBdxSmPqg5vsbebSmZZewLY46uTd/hdi//ZW30WzKBjjhUGMDPI8+iCarbPBQ/geAErMOKgV3G0wwNoA6USS4Ori5/8DrKmV6oF70oB08mE+tm8pWXj1OyzaW8dZMYaroWmVFoZO2eC4a7LA1fDmf/rp8bZ1LAqrsicUAeIRfOIXjtJaAhb8Hf88C2QKVIC5u23rgdxgD9AFTSyekRDa5KWClDwk4zQ22GKBCHrcGJi+rIODYFnK7ePnW9etdg49RG6dAZvm9DkX8t3KoSsZyvSlCMKJEEAFkmirERUGbbiacxziiCcZx0OOM3gwdVPgIv7aUb17DpfWcqm457ne4jr/GkEJVeEaBnZwG9ZwvrKXrrqOxXyQEEzSCmVxCHrUkTPUxRnIx3oZiekFKwKPL8jI0Ed3q7DbnT1HHLcMyInzISU6rHptxXPwhmugk0bs2xHVW+zWkNimL64wijEFJZc9z0XVbwk3z13vOk/7DiGXY7wErbzAhZbUfj0CUMnV3OJsNBzMAoQkW72gF0MM3iFdJn1IN2Z+f5S2LVZv4SH22gJtwn8K39uQN0K33tG1KEI+vUDEMn/Oo+ZLsOLEV5A+vuxESfV9a56cPEkIZ9gmNMXhnmTpG2qRCwhCZhOel0/ygOzElpWlwChlNWbRRaIiE0uLYcQNtCppFycCKaryaEM39UJ5zR7chAYMYn8VbMcbQtJOxg02ptFS5PmJUlWqI0jXJO6/J8Rw1VeAdr+2VAZ5CEi/zrV/GDFiReSTeXxx19b6braOB5pG6caFyLM9rnPbYljz8RGtKI7+iaJpFuWjcrLTesbaAP9Qsb61yy+IclsQjia7F0RN+ZNxWrjrvGo0swtpSWkFQYAUScMMRUJU2eowizCctxdq3DvCaC8ieeU8T+2LgPRwX7ExqFVxQTfUHHurD2J7kYA8vsPgAzJ+PdXv0gcut2nsJnyZfjB8PvG7qVbOpf5zjFWTDBjBkBb4ebKuiaoLT+scb4D1pr74LrsBxRNwL+FSePjd8LOFlWreiDQ85lmO1A2wxDyNlKncjoxQHXJi2q0VZijR4s/JwBG3hdfU13AZbS3J/tce8epOSSs2LQAnXhQUZmm3KEXh+2BuWZj0JeyH9m82FIb4aLpXgQswFfBy26BhJ8qAfwqlf8Uan8JIUBAR/PVWE6c/B5AGqeiZGE5weM+lfQRMD1lWmIm/yfdC8TMACPDoazAI3fKy7BvmpyRBZFr8B1ALyglJwqC4jJm4WT2DthVYd0C4eU0FopvN2mLcS+XjD3SHIY9ppHlKxFhuw80FMlfUD7og7Ki94uiu0zfYJzMLi8qEmFr/aZJM7AcXzgc/N6rUyeS1WOE8ayG/DxkrB+T9mcWAnvssrkdxetbAHcbje74mE1RN1BqsH+Zrb0MTyUJ6uegbX+zgvHCHBWQYYnGvcwIlE8VizMVjDpCmn146y9O8oi//BPW7YQMcL/qT658AHprwf1AgeztfpjG4czv98K0CW78NSxZok9LD4iw+0wHx7mp6MkoRb167q1O7pO8CKZazigt/3UNijBXetFNoHG2Ls7amFMkpcnPT8N/SK1r2URdBNtt0VBMw/EjFK6pUsbMFE8wP3HOCBs13A3dIBKNarOR6IdhLGk2Ippu19xasRhn0DS07AchnJlBu4j6+rLrirgkKlqkuAcw0Bg4VzzkxWpmdA7yiJzwF9brSjFq/Q9G8G7kkXfwm6XdYZSRQEDFKCHg5sL5QboiYlSGNunNJ5SMA8KbckZcTm9nE7By1meVZ7PeJQMGgB41W51nch3lDpSoLwuCNifG+NYfrXAwSDVaWd7jCOJucLf2FivCPuw9GBB1rfsM/t0ev6lI7h9ROvwCB3UQSFZwRhcimLt0WnKj63giKQJACeCni4Oe0l+3l0U7FgwNsT7h6jeQrEOwX8i7dXqKoMngII0/MvE2BlX0FYIGFtPmQNWu64gVcCt/fedicFUx/YesxZfwOujv6uh7fErktJgv61NUtxpVhmGJZxmMexMh9ogvXhS4taHWPrtd2C68NosxqGvpO1gMEDLFF1KZBIuqo3lZM7JayEswZuC+2KDsAU2CyJt0wzWlkA8ZgQ9Fn4VRycI/TGEQD2lNKxmufoIkVS63qvN+J9hSpNVTpWyM+GB/TZWcxwhjOTfnnan1TvDT4UNrqEWAaswyETrbrP9GqLQi3tQkuPircUpAi3QxKqLxxE3Pzs696i9C8Sauu/Ml/1XgypKFftk1w6RazojF4BnRyKWFRvY0+ut4Df41KlFbWR5/j8KDhpg+Xkzb0t8EB11EvR96RTqOvYtm9vEtybw1+IGUBWQLBRfs3bKmrNKx5H/XgQGiPexYnytitJHXwhCWfolGTnitg063Q0WIFg0LeMbQu7KQDJ8pbiwmZN2nRYTipVeQpTdfxXbAT3lZhWvXIA1IgTHG9GbDIl5nWC8OrmvUzBpMcJhdxqH7Thl8uXs8ty+7NpfF97pC2iU2o/A7wjUU8naZ81Hs4xDek6UT4Z8LwBTnX+fs3N7ghW+WWbh2R2HN2zKXVx2tdz52Q4TbOHmOaWERvr1bY778c4Vapn2ANzIy4lHlFe7CZ2eqdSZWC6q2U+okbazK5EqWwSbZhy4eP7B/wiJKBZKd9AM1Tt3pyk0tIsBXLclpBK/Dg3gpqd+YMP8jRCthlrubYRUU6ffTzCfIRldYmauKazwgbmfcEYUFbY0l7stlS0un6JCgREQsy5ww2yLujMvJjN57sIqDWbTwLD/fNf1cqgJkqU4IOE4UZPm03cdLhO7YlsqSXUo7SNdnZYlO4f8hCrCsyCpC7ABLJimzmYHVwTOm4iFinZfIWI+xcT+tXsWxF74CwqeRU6KJMwzg4qD7n6Bx4Rc1XYWUasP7cFjOjgF8KASPzPz4+ER18QCRXUGzNw07BukqBf/UqvB5NmhyE4Lp4cUn14P1+7nLPJI7uS99H3CjL0wF7Aze3/lMOB3X+yD6h2J5R1lSbcFB8dd3Cm3zjHg/NzLREvP20/92sUVbXN69crQq+kn8fV1TGYXtbRx2z9KCj9fLi5RhFK3UKIyof3BL9XBEAAwMatCsTZQGyKZDmq2+f0+YjMCimcAda1O1pixZUueNnrYOC64cER4RS9U5rRx21qiHYBqGwH/CbQ3f5GeHWT7Taw4krt0XMjwHOL2eYnbY+NzI9pg4/P4fDGCh9U2/djVdLPk3sNsPQ660ztzUm6H31albBum8LQrL8hy1UkjF+2bvWD59T+lvRW95ZSQCjVl29QeeG9gMfPlvQkBosJyq4afkVCIMMNioSo1r9sAs4qLXbYBSG0p77e1mE5uqrMt/JW+FFly4p3Y+FVbfd7oDv0Se+8lGUv4O06ngjkeR6DSbrUspd+8bknyUHpt5CETbByZQbj2hcdVk9gMdeotbX4wItRTjHFLYk0WPpxQ8koIlEbtV/v+jLYoOwNqQXF6o6sjkoB572J9d9U4nn8pBvoJXyh3zRSx6xAp6Fe9VFF73Ifa8LF8j98h2NqDUsv1Qb5W5gS8vv7C5+kQ+kAHvXz5nHEOngK114lFj2n3cAt6F9Y0VTAd+z2Y6/sSvsX8nRTFld+khVwXsqgqOzf9NPOngLM6j0pr9mujRZUz3FISQXMP/yUoU/Hi4rOLsrie9J94AUB38MQLIvhtNyQlQXsvrXSZtN8nCH6Eyhis/JdSc3TUvzhx7JcL1AERPddMjwr6Gy396kAS1NRHsgL2MIGivB7KU3297TDgP2y3vmX0asQsEoAQHc+9T44pwhvRxE+FuHDDVeW+HoCp3jiZb2vpvVhVGxyBAQPmAImPJvB3i5er4P2fcxTBH9Drqz6jL45j8Mp3fPB7KFmLaszjgDRbl/Xgfd4KyP7ls6435E47Jd1zXnU67Uwj/mhXQx3xskTyPCmzrhfkVEVl81g/KAePsOnE/g5g92jPEPrLIr9DbrauHQGP9aug+uAYxKG4MnFbBU5hqcc8QVOH+ukoUgGaD664R6rwvD5Wf42ue5rfaF//3YMSowC/ASN0c4aNm/xiiqKE2d2qeP1UaZ7BhbnNgF2nyCPLijI9xXhx5BsHX4igggD7JW4Bb9hBo+PtiN4ZHM9hCbay/c1Rupk67Tzos0m7nGGCpAoHrsGv6H+yMYF6l1voKri+zNMiwgJhMg0zbROyUcNdORcwIcOPvrC9EZFCZvfUGRQ3OPaP66HvOfIl0uoPQFHcv1uNbdBZ3oKBqBY7+EC7a+4pXzDBPbTI/b1l8LTrB/DfmnnzjkV7t+x1/dvylnuQcJVZV5vTYU/1iEg/ppY1nWMjVLdes95sMq4eadXTT9R0r5hUT0IbWvjQFBlLBlvzJsIDjoENE1S+4WpX4hhiE0PEA/PqqJGQxC67yozGO4dt3C0WkRfkHr/DMj+YHNhqoSpCd/FEo6346uPZ3u+D5b/PibctoWEP333H2CHA7pcryrqN5jodnW3lWfD97abm/GZcMqrEJhV1aoD8ISA6+3YOb3MF75G8CPAFSzgY+WtaVXr3NVjtr6s99jD0EpvyGphc/7OtTrLGcIk/9j8rUAC2vitucNbl2L9GoH/KCavet9yJaLcK95cfkvG8ovRe7Oh2vNyhy36eEHOPworn8DkRR7b/0ceODM3/xtb3CfwxzjiU28M+5/A3IT4OSG4/0cp/gAORt+RI/ePwgA+xmZs/f8sfhmSUTu0nf/Bfe7/AB4KB0b3C9rTAAAAAElFTkSuQmCC",
      "exploration_content": "For local and neighboring properties"
    },
    {
      "name": "2 Opex Budget",
      "link": "https://www.google.co.in/maps/@11.0273656,77.0219015,15z",
      "exploration_content": "Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content"
    },
    {
      "name": "Test solutions Opex Revenue",
      "link": "http://test.staging-solutions.socrata-qa.com/#!/analysis?dashboard[currentMetricTypeName]=All%20Metrics&currentDrilldownTemplateName=Opex%20Revenue&currentDrilldownDimensionField=dimension_1_mik7_qbhe_0&currentVisualizationType=snapshot&currentDrilldownGroupByField=&currentDrilldownViewField=view_1_mik7_qbhe_1&drilledDownDimensions=%5B%5D&genericFilters=%5B%5D&filteredGeojson=%7B%22type%22%3A%22FeatureCollection%22%2C%22features%22%3A%5B%5D%7D&quickFilters=%5B%5D&dateRange[startDate]=2018-04-01&dateRange[endDate]=2019-03-31&sortColumns=%5B%5D",
      "exploration_content": "Test exploration card text content",
      "image": ""
    }
  ]
}
