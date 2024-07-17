
const codeHons = document.getElementsByClassName('qe');
const answer = document.getElementsByClassName('ans');
const topNav = document.getElementsByClassName('topnav')[0];
var showItemsDiv = document.getElementsByClassName('items_that_are_added ');
var allAdded = document.getElementsByClassName('all_added')[0];
var del = document.getElementsByClassName("del");
const product__name = document.getElementsByClassName('product__name')[0];
const price = document.getElementsByClassName('price')[0];

var lastScroll = 0;
Array.from(codeHons).map((current, index) => {
  current.addEventListener('click', () => {
    answer[index].classList.toggle("show_ans");
  });
});


window.addEventListener('scroll', (e) => {
  let scroll = window.scrollY;

  if (scroll > lastScroll) {

    topNav.classList.add("hide");
    topNav.classList.remove("show")


  } else {
    topNav.classList.remove("hide");

    topNav.classList.add("show");

  }
  lastScroll = scroll;

});


function add_to_cart() {

  const yesNo = confirm('Do you want to add to card?');
  if(!yesNo) {
    return;
  }

  // Retrieve items from local storage
  const items = JSON.parse(localStorage.getItem('items')) || [];

  // Check if there are items in the cart
  if (items.length > 0) {
    // Get the last item's productId and increment it for the new item
    const lastProductId = items[items.length - 1].productId;
    const newItem = {
      productId: lastProductId + 1,
      productName: product__name.innerHTML,
      productPrice: price.innerHTML

    };

    // Add the new item to the items array
    items.push(newItem);

    // Save the updated items back to local storage
    localStorage.setItem('items', JSON.stringify(items));
  } else {

    // If the cart is empty, add the first item
    const newItem = [{
      productId: 1,
      productName: product__name.innerHTML,
      productPrice: price.innerHTML
    }];

    // Save the items to local storage
    localStorage.setItem('items', JSON.stringify(newItem));
  }
}




function show_items() {
  allAdded.innerHTML = '';
  console.log(allAdded)
  document.body.classList.add("no");
  showItemsDiv[0].style.display = 'block';
  const items = JSON.parse(localStorage.getItem('items')) || [];
  if (items.length > 0) {
    let html_dynamic;
    items.map((current, index) => {
      html_dynamic = `
    <div class="added_items">
      <h3>${index + 1} </h3>                                                                                                                                                                                                                                                                                                      
      <div class="name">${current.productName}</div>
      <div class="price">${current.productPrice}</div>
      <div class="del">delete</div>
    </div>
      `
      allAdded.innerHTML += html_dynamic;
    });

    const added_items = document.querySelectorAll('.added_items');
    if (del.length > 0) {
      Array.from(del).forEach((current, index) => {
        current.addEventListener('click', () => {
          added_items[index].style.display = "none";
          items.splice(index, 1);
          localStorage.setItem('items', JSON.stringify(items));

        })
      })
    }
  } else {
    allAdded.innerHTML = `<h1 class="no_">No items. </h1>`;

  }



}

function cut_items_div() {
  document.body.classList.remove("no");

  showItemsDiv[0].style.display = 'none';
}


// testing
const mode = document.querySelector('.mode');
mode.addEventListener('click', () => {
  document.body.classList.toggle('dark_mode');
  topNav.classList.toggle('dark_nav')
})