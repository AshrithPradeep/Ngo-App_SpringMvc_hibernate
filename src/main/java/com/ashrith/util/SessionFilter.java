package com.ashrith.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

	private ArrayList<String> urlList = new ArrayList<String>();

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		boolean allowedRequest = false;
		System.out.println("in filter");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String url = req.getServletPath();
		List<String> urlList = new ArrayList<String>();
		urlList.add("index.jsp");
		urlList.add("signin");
		urlList.add("logout");
		urlList.add("template");
		urlList.add("showVolunteerForm");
		urlList.add("saveUser");
		
		for (String str : urlList) {
			if (url.contains(str)) {
				allowedRequest = true;
			}
		}

		HttpSession session = req.getSession(false);

		boolean isSessionSet = session != null && session.getAttribute("sessionBean") != null;

		if (!isSessionSet && !allowedRequest) { // checking
			res.sendRedirect(req.getContextPath() + "/");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig config) throws ServletException {
		String urls = config.getInitParameter("avoid-urls");
		StringTokenizer token = new StringTokenizer(urls, ",");

		urlList = new ArrayList<String>();

		while (token.hasMoreTokens()) {
			urlList.add(token.nextToken());

		}
	}
}