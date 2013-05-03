$(function() {
  return $('#query_stock').autocomplete({
    source: "/autocomplete/stock"
  });
});