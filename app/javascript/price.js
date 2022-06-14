window.addEventListener('load', function (){
  const itemPrice = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('keyup', ()=> {
    const itemTax = Math.floor((itemPrice.value)/ 10)
    const itemProfit = Math.floor(itemPrice.value - itemTax)
    tax.innerHTML = `${itemTax}`
    profit.innerHTML = `${itemProfit}`
  });
});
