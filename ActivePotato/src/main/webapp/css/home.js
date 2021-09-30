
const left = document.getElementById('split left');
console.log(left);
const right = document.getElementById('split right');
console.log(right);
const container = document.querySelector('.container');

left.addEventListener('mouseenter', () => {
	container.classList.add('hover-left');
});

left.addEventListener('mouseleave', () => {
	container.classList.remove('hover-left');
});


right.addEventListener('mouseenter', () => {
	container.classList.add('hover-right');
});

right.addEventListener('mouseleave', () => {
	container.classList.remove('hover-right');
});
