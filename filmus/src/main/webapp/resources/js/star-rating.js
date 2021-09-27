let star = document.querySelectorAll('input');

for (let i = 0; i < star.length; i++) {
    star[i].addEventListener('click', function(){
        i = this.value;

        document.getElementById('rating-value').innerHTML = ' ' + i + ' / 5.0';
    });
}