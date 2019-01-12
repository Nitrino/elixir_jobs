export default function (selector) {
    const inputs = document.querySelectorAll(selector);
    for (let input of inputs) {
        const label = input.nextElementSibling
        const labelVal = label.innerHTML;

        input.addEventListener('change', function (e) {
            let fileName = '';
            if (this.files && this.files.length > 1) {
                fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
            } else {
                fileName = e.target.value.split('\\').pop();
            }

            if (fileName) {
                label.querySelector('span').innerHTML = fileName;
            } else {
                label.innerHTML = labelVal;
            }
        });
    }
};
