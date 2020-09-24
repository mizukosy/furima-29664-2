function price(){
  const itemPrice = document.getElementById("item-price");
  const priceTax = document.getElementById("add-tax-price")
  const priceGaine = document.getElementById("profit")
  itemPrice.addEventListener("keyup", () =>  {
    const priceValue = itemPrice.value;
    const addTaxPrice = priceValue * 0.1;
    const addGainePrice = priceValue * 0.9;
    priceTax.innerHTML = addTaxPrice
    priceGaine.innerHTML = addGainePrice
  });
}
window.addEventListener("load",price);