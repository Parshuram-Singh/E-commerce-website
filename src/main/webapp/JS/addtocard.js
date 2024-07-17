
// alert('a')
var allButtons = document.querySelectorAll('.button');
console.log(allButtons)
// Retrieve existing data (if any) from localStorage
const dataE = localStorage.getItem('myData');

// Parse existing data into an array (or create an empty array if there's no data)
let dataArray = dataE ? JSON.parse(dataE) : [];

// Get all buttons and add click event listeners
allButtons.forEach(function (c, i) {
  c.addEventListener('click', function () {
    if(c.innerHTML == 'Already added') {
        alert('Your item hasbeen already added! ')
    }
    alert(`Your ${i} number item hasbeen added!`)

                c.innerHTML = 'Already added';
                c.classList.add('alButton')

                
  });
});


