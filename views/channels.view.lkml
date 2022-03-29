view: channels {
  sql_table_name: `sourabhjainceanalytics.retail_demo.channels`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, transaction_detail.count]
  }
}
