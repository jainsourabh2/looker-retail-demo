view: products_pdt {
    derived_table: {
      explore_source: products {
        column: id {field:products.id}
        column: brand {field:products.brand}
      }
      datagroup_trigger: products_dg
    }
  }
