function post() {
  const priceInput = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const price = priceInput.value;
    const taxPrice = Math.floor(price * 0.1);
    const profitPrice = price - taxPrice;
    tax.textContent = taxPrice.toLocaleString();
    profit.textContent = profitPrice.toLocaleString();
  });
}

window.addEventListener("load", post);
