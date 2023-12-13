document.addEventListener('DOMContentLoaded', badge_selector);
document.addEventListener('turbo:render', badge_selector);

function badge_selector() {
    const ruleSelect = document.getElementById('badge_rule_id');
    const categorySelect = document.getElementById('category_select');
    const testSelect = document.getElementById('test_select');
    const levelSelect = document.getElementById('level_select');
    const optionDataField = document.getElementById('badge_option_data');

    if (ruleSelect)
        ruleSelect.addEventListener('change', function() {
            if (ruleSelect.value === '1') {
                categorySelect.style.display = 'block';

                categorySelect.addEventListener('change', function () {
                    const badgeCategoryId = document.getElementById('badge_category_id')
                    optionDataField.value = badgeCategoryId.options[badgeCategoryId.selectedIndex].text
                });

            } else {
                categorySelect.style.display = 'none';
            }
            if (ruleSelect.value === '2') {
                testSelect.style.display = 'block';

                testSelect.addEventListener('change', function () {
                    const badgeTestId = document.getElementById('badge_test_id')
                    optionDataField.value = badgeTestId.options[badgeTestId.selectedIndex].text
                });

            } else {
                testSelect.style.display = 'none';
            }
            if (ruleSelect.value === '3') {
                levelSelect.style.display = 'block';

                levelSelect.addEventListener('change', function () {
                    const badgeTestLevelId = document.getElementById('badge_test_level_id')
                    optionDataField.value = badgeTestLevelId.options[badgeTestLevelId.selectedIndex].text
                });

            } else {
                levelSelect.style.display = 'none';
            }
        });
}
