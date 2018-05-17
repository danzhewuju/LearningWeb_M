package Home;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "Chinese " ,value = "/*")
public class Chinese implements Filter {
    private FilterConfig filterConfig;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        chain.doFilter(req,resp);
    }

    public void init(FilterConfig config) throws ServletException {
        this.filterConfig=config;


    }

}
