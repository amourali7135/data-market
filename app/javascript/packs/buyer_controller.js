
// # Ray infinite pagination attempt
const buyerController = {
  container: document.documentElement,
  postsContainer: document.getElementById("buyers-container"),
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

  buyerController.attachInfiniteScroll();

  global.buyerController = buyerController;


  // # Ray infinite pagination attempt
