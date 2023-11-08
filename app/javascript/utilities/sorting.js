document.addEventListener('turbo:render', initSortByTitle)
document.addEventListener('DOMContentLoaded', initSortByTitle)

function initSortByTitle() {
    const control = document.querySelector('.sort-by-title');

    if (control) {
        control.addEventListener('click', sortRowsByTitle);
    }
}

function sortRowsByTitle() {
    const table = document.querySelector('table');
    const tbody = table.querySelector('tbody');
    const rows = Array.from(tbody.querySelectorAll('tr')).slice(0);

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        rows.sort(compareRowsAsc);
        this.querySelector('.octicon-arrow-up').classList.remove('hide');
        this.querySelector('.octicon-arrow-down').classList.add('hide');
    } else {
        rows.sort(compareRowsDesc);
        this.querySelector('.octicon-arrow-down').classList.remove('hide');
        this.querySelector('.octicon-arrow-up').classList.add('hide');
    }

    tbody.innerHTML = '';

    rows.forEach(function(row) {
        tbody.appendChild(row);
    });
}

function compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent;
    const testTitle2 = row2.querySelector('td').textContent;

    if (testTitle1 < testTitle2) return -1;
    if (testTitle1 > testTitle2) return 1;
    return 0;
}

function compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent;
    const testTitle2 = row2.querySelector('td').textContent;

    if (testTitle1 < testTitle2) return 1;
    if (testTitle1 > testTitle2) return -1;
    return 0;
}
