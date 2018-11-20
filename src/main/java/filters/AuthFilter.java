package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebFilter({"/*"})
public class AuthFilter implements Filter {

    private List<String> excludedUrls;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = ((HttpServletRequest) servletRequest).getSession(false);
        String loginURI = request.getContextPath() + "/login";
        String assetsURI = request.getContextPath() + "/assets";
        String registerURI = request.getContextPath() + "/register";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean assetsRequest = request.getRequestURI().startsWith(assetsURI);
        boolean registerRequest = request.getRequestURI().startsWith(registerURI);

        if (loggedIn || loginRequest || assetsRequest || registerRequest) {
            filterChain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }
    }

    @Override
    public void destroy() {

    }
}
