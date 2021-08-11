function price (){
  const priceForm = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceForm.addEventListener('input', function(){
    const formValue = priceForm.value;
    tax.innerHTML = `${Math.floor(formValue / 10)}`
    profit.innerHTML = `${Math.ceil(formValue - formValue / 10)}`
  })
};

window.addEventListener('load', price)