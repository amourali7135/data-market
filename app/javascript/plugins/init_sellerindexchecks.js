$('#selectAll').click(function () {
  if (this.checked) {
    $(':checkbox').each(function () {
      this.checked = true;
    });
  } else {
    $(':checkbox').each(function () {
      this.checked = false;
    });
  }
});

// export {
//   initsellerindexchecks
// }

// what does this file even do?
// Ohhh, it's for the seller index checkbox shit!  Why does it not work uncommented out though?  Strange.
