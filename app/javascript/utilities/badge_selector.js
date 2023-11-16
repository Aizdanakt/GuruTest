document.addEventListener('DOMContentLoaded', test);
document.addEventListener('turbo:render', test);

function test() {
    const ruleSelect = document.getElementById('badge_rule_id');
    const categorySelect = document.getElementById('category_select');
    const testSelect = document.getElementById('test_select')
    const levelSelect = document.getElementById('level_select')
    if (ruleSelect)
        ruleSelect.addEventListener('change', function() {
            if (ruleSelect.value === '1') {
                categorySelect.style.display = 'block';
            } else {
                categorySelect.style.display = 'none';
            }
            if (ruleSelect.value === '2') {
                testSelect.style.display = 'block';
            } else {
                testSelect.style.display = 'none';
            }
            if (ruleSelect.value === '3') {
                levelSelect.style.display = 'block';
            } else {
                levelSelect.style.display = 'none';
            }
        });
}
