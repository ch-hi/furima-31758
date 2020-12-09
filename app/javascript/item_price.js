const pay = () => {
  Payjp.setPublicKey("pk_test_cf3a19d0219f760b8bce012c"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy[number]"),
      cvc: formData.get("buy[cvc]"),
      exp_month: formData.get("buy[exp_month]"),
      exp_year: `20${formData.get("buy[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        // console.log(token)　
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
      }
      document.getElementById("buy_number").removeAttribute("name");
      document.getElementById("buy_cvc").removeAttribute("name");
      document.getElementById("buy_exp_month").removeAttribute("name");
      document.getElementById("buy_exp_year").removeAttribute("name");
    
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);


// window.addEventListener('load', function(){
//   const textField = document.getElementById("item-price");
//   const priceContent = document.getElementById("add-tax-price");
//   const profitContent = document.getElementById("profite");

//   // 入力するたびにイベント発火できる,入力した金額の値を取得する
//   textField.addEventListener("input", () => {
//     const inputValue = textField.value;
//     priceContent.innerHTML = Math.floor(inputValue*0.1);
  
//     const profitContent = document.getElementById("profit");
//     profitContent.innerHTML = Math.floor(inputValue-(inputValue*0.1));
  
//   })
// })
