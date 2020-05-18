
function display_fields(element) {
  var val = $(element).val();
  if (val == "Student") {
    $(".instructor-fields").addClass("hidden");
    $(".student-fields").removeClass("hidden");
  } else if (val == "Instructor") {
    $(".student-fields").addClass("hidden");
    $(".instructor-fields").removeClass("hidden");
  } else {
    $(".instructor-fields").addClass("hidden");
    $(".student-fields").addClass("hidden");
  }
}
