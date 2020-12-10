// //イベント発火
// const pay = () => {
//   Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
//   const form = document.getElementById("buy-red-btn");
//   form.addEventListener("submit", (e) => {
//     e.preventDefault();
 
//     //カード情報の取得先
//     const formResult = document.getElementById("buy-red-btn");
//     const formData = new FormData(formResult);
 
//     const card = {
//       number: formData.get("number"),  // カード番号
//       cvc: formData.get("cvc"),        // カード裏面の3桁の数字
//       exp_month: formData.get("exp_month"),      // 有効期限の月
//       exp_year: `20${formData.get("exp_year")}`, // 有効期限の年
//     };
    
//     //カードオブジェクトをPAY.JPに送信
//     Payjp.createToken(card, (status, response) => {
//       if (status === 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("buy-red-btn");
//         const tokenObj = `<input value=${token} type="hidden" name='card_token'>`;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
 
//         //カード情報がparamsに含まれないようにする記述
//         document.getElementById("number").removeAttribute("name");
//         document.getElementById("cvc").removeAttribute("name");
//         document.getElementById("exp_month").removeAttribute("name");
//         document.getElementById("exp_year").removeAttribute("name");
        
//         //トークンをコントローラーに送信
//         document.getElementById("buy-red-btn").submit();
//         document.getElementById("buy-red-btn").reset();
//       }
//     });
//   });
//  };
//  //これまで記述した関数を全て「定数pay」に代入
//  window.addEventListener("load", pay);