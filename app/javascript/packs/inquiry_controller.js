
// # Ray infinite pagination attempt
const inquiryController = {
  container: document.documentElement,
  postsContainer: document.getElementById("inquiries-container"),
  moreBtn: document.getElementById("more-btn"),
  insertItems(items) {
    // console.log(items)
    this.postsContainer.insertAdjacentHTML("beforeend", items);
  },
  setNextPage(nextPage) {
    const url = new URL(this.moreBtn.href);
    url.search = `?page=${nextPage}`;
    this.moreBtn.setAttribute("href", url.search);
  },
  attachInfiniteScroll() {
    // console.log(this.moreBtn)
    if (this.moreBtn) {
      document.addEventListener("scroll", () => {
        if (
          document.documentElement.scrollTop + document.documentElement.clientHeight >=
          document.documentElement.scrollHeight
          ) {
            // console.log("hello")
            this.moreBtn.click();
          }
        });

      }
    }
  };

  inquiryController.attachInfiniteScroll();

  global.inquiryController = inquiryController;


  // # Ray infinite pagination attempt
