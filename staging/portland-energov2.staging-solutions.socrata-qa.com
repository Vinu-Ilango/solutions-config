{
	"branding": {
		"browser_title": "Portland EnerGov Executive Insights",
		"title": "Portland EnerGov Executive Insights"
	},
	"tag_list": [
		"Permitting",
		"Code Enforcement",
		"Inspections"
	],
	"date": {
		"startDate": "2018-1-1",
		"endDate": "2020-01-27"
	},
	"show_share_via_email": true,
	"is_private": "false",
	"template_entries": [{
			"name": "Permitting",
			"description": "Permitting",
			"dataset_domain": "portlandme.data.socrata.com",
			"dataset_id": "2yai-kkq6",
			"fields": {
				"date_column": "applicationdate",
				"incident_type": "permittype",
				"location": "geocoded_column",
				"x8fa-hvzr": ":@computed_region_x8fa_hvzr"
			},
			"dimension_entries": [{
					"column": "permittype",
					"name": "Permit Type"
				},
				{
					"column": "permitworkclass",
					"name": "Permit Class"
				}
			],
			"group_by_entries": [{
					"column": "permittype",
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
				}
			],
			"view_entries": [{
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
					"end_date_override_and_ignore": "true",
					"start_date_boolean_override": "<",
					"parent_queries": [
						"select *,:@computed_region_x8fa_hvzr where permitstatus in ('In Review', 'Submitted', 'In Review - Pending Payment', 'Submitted - Incomplete', 'Pending Payment', 'Submitted - Online', 'Third Party Review', 'Ready to Issue')"
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
								"secondary_metric_entries": [{
									"column": "permitnumber",
									"name": "Number of Permits",
									"aggregate_type": "count",
									"prefix": "",
									"suffix": "",
									"precision": "0",
									"render_type": "bullet"
								}],
								"bench_mark_entries": [{
									"name": "90%",
									"value": "90"
								}]
							},
							"scatterplot": {
								"default_show_range": "false",
								"secondary_metric_entries": [{
									"column": "permitnumber",
									"name": "Number of Permits",
									"aggregate_type": "count",
									"precision": "",
									"prefix": "",
									"suffix": ""
								}]
							}
						}
					},
					"fields": {
						"date_column": "applicationdate"
					},
					"parent_queries": [
						"select :@computed_region_x8fa_hvzr, geocoded_column,applicationdate, permitnumber, permittype, permitstatus, permitworkclass,projectname, district, applied_to_issued, case(applied_to_issued < 30, 1) as less_than_30_count where isstatusissued='true'"
					],
					"target_entries": [{
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
					"target_entries": [{
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
			"leaf_page_entries": [{
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
					"column": "permittype",
					"name": "Permit Type"
				},
				{
					"column": "district",
					"name": "District"
				}
			],
			"map": {
				"centerLat": "43.680768,",
				"centerLng": "-70.294197",
				"zoom": "10",
				"mini_map_zoom": "9",
				"shapes_outline_highlight_width": "4",
				"style_entries": [{
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
			"shape_dataset_entries": [{
				"shape_dataset_domain": "portlandme.data.socrata.com",
				"shape_dataset_id": "x8fa-hvzr",
				"shape_name": "City of Portland Zip Codes",
				"fields": {
					"shape": "the_geom",
					"shape_id": "_feature_id",
					"shape_name": "geoid10",
					"shape_description": "geoid10"
				},
				"color": "#32a889",
				"border_color": "#cccccc",
				"mini_map_border_color": "#4d4e4f",
				"outline_highlight_color": "#808080"
			}]
		},
		{
			"name": "Inspections",
			"description": "Inspections",
			"dataset_domain": "portlandme.data.socrata.com",
			"dataset_id": "scaz-p7cm",
			"fields": {
				"date_column": "requestdatetime",
				"incident_type": "inspectiontypename",
				"location": "location",
				"x8fa-hvzr": ":@computed_region_x8fa_hvzr"
			},
			"dimension_entries": [{
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
			"view_entries": [{
					"name": "Open Inspections",
					"column": "requestdatetime",
					"aggregate_type": "count",
					"precision": "0",
					"prefix": "",
					"suffix": "",
					"tags": [
						"Inspections"
					]
					,"parent_queries": [
						"select *,:@computed_region_x8fa_hvzr where inspectionstatusname in ('Re-inspection required', 'Sheduled', 'Follow-up Required','Requested','Re-inspection required first','Re-inspection required second','Re-inspection required third')"
					],
					"visualization": {
						"default_view": "snapshot",
						"snapshot": {
							"chart_type": "barChart"
						}
					}
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
					"target_entries": [{
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
			"leaf_page_entries": [{
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
				"centerLat": "43.680768,",
				"centerLng": "-70.294197",
				"zoom": "11",
				"mini_map_zoom": "11",
				"shapes_outline_highlight_width": "4",
				"style_entries": [{
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
			"shape_dataset_entries": [{
				"shape_dataset_domain": "portlandme.data.socrata.com",
				"shape_dataset_id": "x8fa-hvzr",
				"shape_name": "City of Portland Zip Codes",
				"fields": {
					"shape": "the_geom",
					"shape_id": "_feature_id",
					"shape_name": "geoid10",
					"shape_description": "geoid10"
				},
				"color": "#32a889",
				"border_color": "#cccccc",
				"mini_map_border_color": "#4d4e4f",
				"outline_highlight_color": "#808080"
			}]
		},
		{
			"name": "Code Cases",
			"description": "Code Cases",
			"dataset_domain": "portlandme.data.socrata.com",
			"dataset_id": "nvz7-tnet",
			"fields": {
				"date_column": "openeddate",
				"incident_type": "codecaseid",
				"location": "geocoded_column",
				"x8fa-hvzr": ":@computed_region_x8fa_hvzr"
			},
			"dimension_entries": [{
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
			"group_by_entries": [{
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
			"quick_filter_entries": [{
				"column": "days_open",
				"name": "Days Open",
				"renderType": "number"
			}],
			"view_entries": [{
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
					"end_date_override_and_ignore": "true",
					"start_date_boolean_override": "<",
					"parent_queries": [
						"select *,:@computed_region_x8fa_hvzr where codecasestatusname not in ('Closed', 'Closed - Unfounded', 'Closed - Resolved')"
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
			"leaf_page_entries": [{
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
				"centerLat": "43.680768,",
				"centerLng": "-70.294197",
				"zoom": "10",
				"mini_map_zoom": "9",
				"shapes_outline_highlight_width": "4",
				"style_entries": [{
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
			"shape_dataset_entries": [{
				"shape_dataset_domain": "portlandme.data.socrata.com",
				"shape_dataset_id": "x8fa-hvzr",
				"shape_name": "City of Portland Zip Codes",
				"fields": {
					"shape": "the_geom",
					"shape_id": "_feature_id",
					"shape_name": "geoid10",
					"shape_description": "geoid10"
				},
				"color": "#32a889",
				"border_color": "#cccccc",
				"mini_map_border_color": "#4d4e4f",
				"outline_highlight_color": "#808080"
			}]
		}
	]
}
