view: customers_derived_native {
  derived_table: {
    explore_source: customers {
      column: id {
        field: customers.id
      }

      column: address {
        field: customers.address
      }
    }
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

}
