# What Is a URL?

A **URL (Uniform Resource Locator)** is the address used to locate a resource on the internet. A resource may be a web page, image, video, document, API endpoint, or file.

## Parts of a URL

Example: `https://www.example.com:443/reports/sales?year=2026#summary`

- **Scheme:** `https` identifies the communication method.
- **Subdomain:** `www` identifies a subdivision of the domain.
- **Domain name:** `example.com` identifies the website.
- **Port:** `443` identifies a network service; it may be omitted when standard.
- **Path:** `/reports/sales` identifies a resource location.
- **Query string:** `?year=2026` sends parameters to the server.
- **Fragment:** `#summary` points to a section within the resource.

## Types of URLs

1. **Absolute URL:** Complete address including scheme and domain.
2. **Relative URL:** Address interpreted relative to the current page.
3. **HTTP URL:** Uses the HTTP protocol.
4. **HTTPS URL:** Uses encrypted HTTP and is preferred for sensitive data.
5. **Static URL:** Usually points to a fixed resource.
6. **Dynamic URL:** Contains parameters that change the returned content.
7. **Canonical URL:** Preferred version of a page when similar URLs exist.
8. **Vanity URL:** Short, memorable URL created for branding or marketing.
9. **API URL:** Endpoint used to request data or services from an API.
10. **FTP URL:** Identifies a file-transfer resource.
11. **Mailto URL:** Opens an email message, such as `mailto:info@example.com`.
12. **Data URL:** Embeds small data directly in a URL.
13. **Localhost URL:** Refers to a service running on the local computer.

## URLs in Data Analytics

URLs help analysts identify web pages, track campaigns, call APIs, and understand traffic sources. Query parameters can contain campaign tags such as source, medium, and campaign name. Analysts should avoid placing passwords, private information, or sensitive personal data in URLs because URLs may be stored in browser history, logs, and referrer data.

## Good Practices

Use HTTPS, keep URLs readable, encode special characters correctly, use stable paths, validate links, and apply access controls to private resources.

## Conclusion

A URL identifies where an online resource is located and how it should be accessed. URLs are essential for websites, APIs, digital marketing measurement, and web analytics.
