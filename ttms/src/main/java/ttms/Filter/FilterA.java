package ttms.Filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Filter;
import java.util.logging.LogRecord;

/**
 * Created by dongmengyuan on 18-6-8.
 */

public class FilterA implements javax.servlet.Filter{
    public void init(FilterConfig arg0) throws ServletException
    {

    }

    public void destroy()
    {

    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
            throws IOException, ServletException
    {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String flag = (String) request.getSession().getAttribute("a");

        if (flag != null && flag.equals("ok"))
        {
            System.out.println("----->right ok");
            filterChain.doFilter(request, response);
        }
        else
        {
            System.out.println("----->right no");
            request.setAttribute("errors", "该用户无权访问该目录");
            RequestDispatcher rd = request.getRequestDispatcher("/views/error.jsp");
            rd.forward(request, response);
        }
    }

}
