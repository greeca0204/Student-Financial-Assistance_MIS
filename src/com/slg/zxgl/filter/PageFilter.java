package com.slg.zxgl.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageFilter implements Filter {
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("before the page filter!");
		HttpServletRequest hreq = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		System.out.println("page Filter已经截获到用户的请求的地址:" + hreq.getServletPath());
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		System.out.println(!hreq.getServletPath().contains("commons") && !hreq.getServletPath().contains("showpanel"));
		if (!hreq.getServletPath().contains("commons") && !hreq.getServletPath().contains("showpanel")) {
			try {
				chain.doFilter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			resp.sendRedirect(basePath + "/nopermission.jsp");
		}
		System.out.println("after the page filter!");
	}

	public void init(FilterConfig config) throws ServletException {
	}

}
