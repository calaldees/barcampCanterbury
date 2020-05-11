function parseGoogleSheetData(data) {
    function* cells() {
        for (let entry of data.feed.entry) {yield {...entry['gs$cell'], ...entry['content']};}
    }
    const _col_heading_lookup = [...cells()].reduce((acc, cell)=>{
        if (cell.row == "1") {
            acc[cell.col] = cell.inputValue;
        }
        return acc;
    }, {});
    const rows = [...cells()].reduce((acc, cell)=>{
        if (cell.row == "1") {return acc;}
        const row = `row${cell.row - 1}`
        if (!acc.hasOwnProperty(row)) {acc[row] = {};}
        acc[row][_col_heading_lookup[cell.col]] = cell['$t'];
        return acc;
    }, {});
    return Object.values(rows);
}
// get GoogleSheet data
// https://www.freecodecamp.org/news/cjn-google-sheets-as-json-endpoint/


/*
function build_talks(data) {
    const $talks = $('#talks');
    for (let talk of data) {
        //<a href="${talk.url || ''}">
        $talks.append(`
            <li class="media">
                <img src="${talk.image_url || 'images/barcampcanterbury_logo.png'}" class="mr-3">
                <div class="media-body">
                    <h5 class="mt-0 mb-1"><a href="${talk.url || ''}">${talk.title}</a> <span>(${talk.duration_in_mins || 'X'} min)</span> <span>${talk.timeslot || ''}</span></h5>
                    <p class="speaker">by ${talk.speaker_name || ''} (${talk.twitter_username || ''})</p>
                    <p>${talk.description || ''}</p>
                </div>
            </li>
        `);
    }
}
*/


/*
fetch(
    'https://spreadsheets.google.com/feeds/cells/1OekUZ8BsxRxY0qEUEDVSUg6D8YuqF23UMHAr9vbWcsM/1/public/full?alt=json',
    {method: 'GET', headers: {}},
)
.then(function (response) {return response.json();})
.then(parseGoogleSheetData)
.then(build_talks);
*/