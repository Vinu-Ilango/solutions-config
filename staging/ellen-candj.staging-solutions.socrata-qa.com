{
  "branding": {
    "browser_title": "Court Insights",
    "title": "Odyssey Court Insights"
  },
  "exploration_card_entries": [
    {
      "name": "Courts and Justice",
      "link": "courtsandjustice.demo.socrata.com",
      "image": "https://www.tylertech.com/Portals/0/Images/Products/ODYSSEY-Courts-Justice-Solution.jpg?ver=2018-09-19-115543-363?format=jpg&quality=80",
      "exploration_content": "Court Operations"
    }
  ],
  "tag_list": [
    "Clearance Rate",
    "Age of Active Pending Cases",
    "Time to Disposition",
    "Trial Date Certainty"
  ],
  "date": {
    "startDate": "2019-1-1",
    "endDate": "2019-12-31"
  },
  "template_entries": [
    {
      "name": "Courts and Justice",
      "description": "",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "w7ey-ag3j",
      "fields": {
        "date_column": "statusdate",
        "incident_type": "odysseycasecategorydescription",
        "location": "countycenterpoint",
        "ii6d-e8ub": ":@computed_region_ii6d_e8ub"
      },
      "dimension_entries": [
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        }
      ],
      "group_by_entries": [
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        }
      ],
      "view_entries": [
        {
          "name": "Clearance Rate",
          "column": "sum(case(isactive='false', 1))/sum(case(isactive='true', 1))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Clearance rates are on-track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Clearance rates are off-track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "bench_mark_entries": [
                  {
                    "dimension_column": "judgeid",
                    "name": "State Standard",
                    "value": "50"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "show_dimensions": "true",
                "show_total": "false"
              }
            }
          }
        },
        {
          "name": "Clearance Rate",
          "column": "sum(case(isactive='false', 1))/sum(case(isactive='true', 1))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Clearance rates are on-track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Clearance rates are off-track"
            }
          ],
          "visualization": {
            "default_view": "map",
            "map": {
              "default_view": "choropleth"
            },
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "bench_mark_entries": [
                  {
                    "dimension_column": "judgeid",
                    "name": "State Standard",
                    "value": "50"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "show_dimensions": "true",
                "show_total": "false"
              }
            }
          }
        },
        {
          "name": "Outgoing Cases",
          "column": "sum(case(isactive='false', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Outgoing Cases",
          "column": "sum(case(isactive='false', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "default_view": "timeline",
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "show_dimensions": "true",
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Outgoing Cases: Entry of Judgment",
          "column": "sum(case(eventstatusmappingcodede='Jury Trial Disposition' or eventstatusmappingcodede='Non-Trial Disposition' or eventstatusmappingcodede='Bench/Non-Jury Trial Disposition' , 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Outgoing Cases: Placed On Inactive Status",
          "column": "sum(case(eventstatusmappingcodede='Placed on Inactive Status', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Incoming Cases",
                    "column": "sum(case(isactive='true', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Incoming Cases",
          "column": "sum(case(isactive='true', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Incoming Cases",
          "column": "sum(case(isactive='true', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "default_view": "timeline",
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "show_dimensions": "true",
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Incoming Cases: New Filing",
          "column": "sum(case(eventstatusmappingcodede='New Filing', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Incoming Cases: Reopened",
          "column": "sum(case(eventstatusmappingcodede='Reopened', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Incoming Cases: Reactivated",
          "column": "sum(case(eventstatusmappingcodede='Reactivated', 1))",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "events",
          "tags": [
            "Clearance Rate"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  },
                  {
                    "name": "Event Status Mapping Code",
                    "column": "eventstatusmappingcodede",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "name": "Outgoing Cases",
                    "column": "sum(case(isactive='false', 1))",
                    "aggregate_type": "",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "events"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Average Age of Active Pending Cases",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "days_active_pending",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "days",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Median Age of Active Pending Cases",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "days_active_pending",
          "aggregate_type": "median",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "days",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Number of Cases Age of Active Pending Cases < 30 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "case(days_active_pending <= 30, 1, true, 0)",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Percentage of Cases Age of Active Pending Cases < 30 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "(sum(case(days_active_pending <= 30, 1, true, 0))/count(casenumber))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Number of Cases Age of Active Pending Cases < 60 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "case(days_active_pending <= 60, 1, true, 0)",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Percentage of Cases Age of Active Pending Cases < 60 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "(sum(case(days_active_pending <= 60, 1, true, 0))/count(casenumber))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Number of Cases Age of Active Pending Cases < 90 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "case(days_active_pending <= 90, 1, true, 0)",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Percentage of Cases Age of Active Pending Cases < 90 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "(sum(case(days_active_pending <= 90, 1, true, 0))/count(casenumber))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Number of Cases Age of Active Pending Cases < 180 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "case(days_active_pending <= 180, 1, true, 0)",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Percentage of Cases Age of Active Pending Cases < 180 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "(sum(case(days_active_pending <= 180, 1, true, 0))/count(casenumber))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Number of Cases Age of Active Pending Cases < 365 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "case(days_active_pending <= 365, 1, true, 0)",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        },
        {
          "name": "Percentage of Cases Age of Active Pending Cases < 365 Days",
          "parent_queries": [
            "select casenumber, statusdate, nextstatusdate,  eventstatusmappingcodede, county as county_, casecategorydescription as casecategorydescription_, casetypedescription as casetypedescription_, nodedescription as nodedescription_, judgeid as judgeid_, max(case( eventstatusmappingcodede in ('New Filing', 'Reopened') , statusdate)) over (partition by casenumber) as last_opened, max(case( eventstatusmappingcodede in ('Reactivated') , statusdate)) over (partition by casenumber) as last_reactivated, max(case( eventstatusmappingcodede in ('Bench/Non-Jury Trial Disposition', 'Jury Trial Disposition',  'Non-Trial Disposition',  'Placed on Inactive Status') , statusdate)) over (partition by casenumber) as last_closed, isopen, isactive, casebacklog |> select casenumber, max(statusdate) as last_statusdate, max(county_) as county, max(casecategorydescription_) as casecategorydescription, max(casetypedescription_) as casetypedescription, max(nodedescription_) as nodedescription, max(judgeid_) as judgeid,  sum(case(eventstatusmappingcodede='Placed on Inactive Status',date_diff_d(nextstatusdate, statusdate), true, 0)) as days_inactive, date_diff_d({END_DATE}, max(case(last_opened is not null, last_opened, true, last_reactivated))) as days_pending,  sum(casebacklog) as casebacklogsum, (days_pending-days_inactive) as days_active_pending group by casenumber having casebacklogsum  > 0"
          ],
          "column": "(sum(case(days_active_pending <= 365, 1, true, 0))/count(casenumber))*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "fields": {
            "date_column": "last_statusdate"
          },
          "tags": [
            "Age of Active Pending Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "80",
              "icon": "icons-check-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "Age of Active Pending Cases on Track"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
          }
        }
      ],
      "filter_by_entries": [],
      "leaf_page_entries": [
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "casetypedescription",
          "name": "Case Type "
        }
      ],
      "quick_filter_entries": [
        {
          "column": "casecategorydescription",
          "name": "Case Category",
          "renderType": "text"
        }
      ],
      "map": {
        "centerLat": "45.71132324235202",
        "centerLng": "-114.2291827084913",
        "zoom": "5",
        "mini_map_zoom": "4",
        "shapes_outline_highlight_width": "2",
        "shapes_outline_width": "0.5",
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
          "shape_dataset_domain": "courtsandjustice.demo.socrata.com",
          "shape_dataset_id": "ii6d-e8ub",
          "shape_name": "County Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "affgeoid"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        }
      ],
      "shape_outline_dataset_entries": []
    },
    {
      "name": "Time to Disposition",
      "description": "",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "x3q2-qjbe",
      "fields": {
        "date_column": "lastcloseddate"
      },
      "dimension_entries": [
        {
          "column": "casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "county",
          "name": "County"
        }
      ],
      "group_by_entries": [
        {
          "column": "casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "county",
          "name": "County"
        }
      ],
      "view_entries": [
        {
          "name": "Mean Time To Disposition",
          "column": "timetodisposition",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "days",
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "30",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Median Time To Disposition",
          "column": "timetodisposition",
          "aggregate_type": "median",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "days",
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "30",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Number of Cases With Time To Disposition < 30 Days",
          "column": "timetodisposition_flag",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
            "select  *, case(timetodisposition <= 30, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Number of Cases With Time To Disposition < 60 Days",
          "column": "timetodisposition_flag",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
            "select  *, case(timetodisposition <= 60, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Number of Cases With Time To Disposition < 90 Days",
          "column": "timetodisposition_flag",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
            "select  *, case(timetodisposition <= 90, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Number of Cases With Time To Disposition < 180 Days",
          "column": "timetodisposition_flag",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
            "select  *, case(timetodisposition <= 180, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Number of Cases With Time To Disposition < 365 Days",
          "column": "timetodisposition_flag",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
            "select  *, case(timetodisposition <= 365, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "90",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Number of Cases With Time To Disposition > 365 Days",
          "column": "timetodisposition_flag",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
            "select  *, case(timetodisposition > 365, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "1",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Percentage of Cases With Time To Disposition < 30 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
            "select  *, case(timetodisposition <= 30, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "timetodisposition_flag",
                    "name": "Cases",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "prefix": "",
                    "suffix": "cases",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Percentage of Cases With Time To Disposition < 60 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
            "select  *, case(timetodisposition <= 60, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Percentage of Cases With Time To Disposition < 90 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
            "select  *, case(timetodisposition <= 90, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Percentage of Cases With Time To Disposition < 180 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
            "select  *, case(timetodisposition <= 180, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "75",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Percentage of Cases With Time To Disposition < 365 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
            "select  *, case(timetodisposition <= 365, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "90",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Percentage of Cases With Time To Disposition > 365 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
            "select  *, case(timetodisposition > 365, 1, true, 0) as timetodisposition_flag"
          ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "tags": [
            "Time to Disposition"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "1",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "casetypedescription",
                    "name": "Case Type",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "judgeid",
          "name": "Judge ID"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "county",
          "name": "County"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "casetypedescription",
          "name": "Case Type",
          "renderType": "text"
        },
        {
          "column": "timetodisposition",
          "name": "Time to Disposition",
          "renderType": "number"
        }
      ],
      "map": {
        "centerLat": "44.40861110588011",
        "centerLng": "-115.16737594966821",
        "zoom": "3",
        "shape_outline_highlight_width": "1",
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
      "shape_dataset_entries": [],
      "shape_outline_dataset_entries": []
    },
    {
      "name": "Court Operations",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "hqva-gm7v",
      "default_view": "snapshot",
      "fields": {
        "date_column": "disposition_date"
      },
      "dimension_entries": [
        {
          "column": "last_casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "last_casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "last_hearingjudgeid",
          "name": "Judge ID"
        },
        {
          "column": "last_nodedescription",
          "name": "Court Name"
        },
        {
          "column": "last_county",
          "name": "County"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        }
      ],
      "group_by_entries": [
        {
          "column": "last_casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "last_casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "last_hearingjudgeid",
          "name": "Judge ID"
        },
        {
          "column": "last_nodedescription",
          "name": "Court Name"
        },
        {
          "column": "last_county",
          "name": "County"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        }
      ],
      "view_entries": [
        {
          "name": "Trial Date Certainty",
          "column": "sum(certainty_count)/count(*)*100",
          "parent_queries": [
            "select count(hearingdate) as total_hearing_dates,casenumber,max(dispositiondate) as disposition_date,min(hearingdate) as first_hearing,max(hearingdate) as last_hearing, max(casetypedescription) as last_casetypedescription, max(casecategorydescription) as last_casecategorydescription, max(casecategorydescription) as last_casecategorymappingdescription, max(hearingjudgeid) as last_hearingjudgeid, max(nodedescription) as last_nodedescription, max(county) as last_county group by casenumber |> select disposition_date,total_hearing_dates,casenumber,first_hearing,last_hearing, last_casetypedescription, last_casecategorydescription, last_casecategorymappingdescription, last_hearingjudgeid, last_nodedescription, last_county, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainty_count"
          ],
          "aggregate_type": "",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Trial Date Certainty"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Average Number of Settings Per Case",
          "column": "total_hearing_dates",
          "parent_queries": [
            "select count(hearingdate) as total_hearing_dates,casenumber,max(dispositiondate) as disposition_date,min(hearingdate) as first_hearing,max(hearingdate) as last_hearing, max(casetypedescription) as last_casetypedescription, max(casecategorydescription) as last_casecategorydescription, max(casecategorydescription) as last_casecategorymappingdescription, max(hearingjudgeid) as last_hearingjudgeid, max(nodedescription) as last_nodedescription, max(county) as last_county group by casenumber |> select disposition_date,total_hearing_dates,casenumber,first_hearing,last_hearing, last_casetypedescription, last_casecategorydescription, last_casecategorymappingdescription, last_hearingjudgeid, last_nodedescription, last_county, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainty_count"
          ],
          "aggregate_type": "avg",
          "precision": "1",
          "prefix": "",
          "suffix": "settings",
          "tags": [
            "Trial Date Certainty"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Total Number of Cases w/ Average Settings Per Case",
          "column": "casenumber",
          "parent_queries": [
            "select count(hearingdate) as total_hearing_dates,casenumber,max(dispositiondate) as disposition_date,min(hearingdate) as first_hearing,max(hearingdate) as last_hearing, max(casetypedescription) as last_casetypedescription, max(casecategorydescription) as last_casecategorydescription, max(casecategorydescription) as last_casecategorymappingdescription, max(hearingjudgeid) as last_hearingjudgeid, max(nodedescription) as last_nodedescription, max(county) as last_county group by casenumber |> select disposition_date,total_hearing_dates,casenumber,first_hearing,last_hearing, last_casetypedescription, last_casecategorydescription, last_casecategorymappingdescription, last_hearingjudgeid, last_nodedescription, last_county, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainty_count"
          ],
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "tags": [
            "Trial Date Certainty"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "name": "Average Number of Settings",
                    "column": "total_hearing_dates",
                    "aggregate_type": "avg",
                    "render_type": "bullet",
                    "precision": "1",
                    "prefix": "",
                    "suffix": "settings"
                  }
                ]
              }
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "last_casetypedescription",
          "name": "Case Type"
        },
        {
          "column": "last_casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "last_hearingjudgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "last_county",
          "name": "County"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
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
    }
  ]
}
