using System.Web;

namespace Sample.CSharp.MVC3.Razor.Tests {
    class StubContext : HttpContextBase {
        StubRequest request;

        public StubContext(string relativeUrl) {
            request = new StubRequest(relativeUrl);
        }

        public override HttpRequestBase Request {
            get { return request; }
        }
    }
}
