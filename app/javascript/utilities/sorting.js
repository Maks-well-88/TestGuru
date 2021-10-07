document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title')
  if (control) {
    // run the function when click on control if exists
    control.addEventListener('click', sortRowsByTitle)
  }
})

function sortRowsByTitle() {
  // define variables and array
  var tableBody = document.querySelector('tbody')
  var rows = tableBody.querySelectorAll('tr')
  var sortedRows = []

  // add strings to the array
  for (var i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  // define variables for icons
  var arrowUp = this.querySelector('.octicon-arrow-up')
  var arrowDow = this.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove('hide')
    arrowDow.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowUp.classList.add('hide')
    arrowDow.classList.remove('hide')
  }

  // сreate a new table with header and classes from the original table
  var sortedTable = document.createElement('tbody')
  sortedTable.classList.add('tbody')
  sortedTable.appendChild(rows[0])

  // add sorted rows to the table
  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  // replace table
  tableBody.parentNode.replaceChild(sortedTable, tableBody)
}

// compare strings for ascending sort function
function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('.sortingTitle').textContent
  var testTitle2 = row2.querySelector('.sortingTitle').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

// compare strings for descending sort function
function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('.sortingTitle').textContent
  var testTitle2 = row2.querySelector('.sortingTitle').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
