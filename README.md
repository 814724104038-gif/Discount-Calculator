🛍️ Discount Calculator - JSP Web Application

A professional web-based discount calculator built with Jakarta JSP (JavaServer Pages) for Tomcat 10+. Features modern UI, persistent form data, and real-time calculation results.

## ✨ Features

### 🎨 **Modern User Interface**
- Gradient design with smooth animations
- Responsive layout (works on mobile & desktop)
- Professional color scheme with icons
- Card-based design with shadows

### 🔧 **Core Functionality**
- Calculate final price after discount
- Display detailed breakdown:
  - Original Price
  - Discount Rate
  - Discount Amount
  - Final Price
  - Total Savings
- Form validation with error handling
- Persistent form values after calculation

### 🔄 **Smart Reset Options**
1. **Reset Form** - Clears all inputs and results
2. **Clear Results** - Hides results while keeping form values

### ⌨️ **Keyboard Shortcuts**
- `Ctrl + R` - Reset entire form
- `Escape` - Clear results only

## 📋 Prerequisites

- **Java JDK** 11 or higher
- **Apache Tomcat** 10.1 or higher
- **Eclipse IDE for Enterprise Java Developers**
- Basic knowledge of JSP and Jakarta EE

## 🚀 Installation & Setup

### Step 1: Clone/Setup Project
```bash
# Create Dynamic Web Project in Eclipse:
File → New → Dynamic Web Project
Project Name: DiscountCalculator
Target Runtime: Apache Tomcat 10.1
Configuration: Default
Step 2: Copy JSP File
Place discount.jsp in:

text
DiscountCalculator/
└── WebContent/
    └── discount.jsp
Step 3: Configure Tomcat
Right-click project → Properties

Project Facets → Ensure:

Dynamic Web Module: 6.0

Java: 11 or higher

JavaScript: 1.0

Step 4: Run Application
Right-click project → Run As → Run on Server

Select Tomcat 10.1

Access at: http://localhost:8080/DiscountCalculator/discount.jsp

📁 Project Structure
text
DiscountCalculator/
├── WebContent/
    |---screenshots
│   ├── discount.jsp          # Main application file
│   └── WEB-INF/
│       └── web.xml           # Deployment descriptor (optional)
├── src/                      # Java source (optional for servlets)
└── README.md                 # This file
🧪 How to Use
1. Enter Values
Original Price: Enter the product price (e.g., 1500000)

Discount Percentage: Enter discount rate (e.g., 18)

2. Calculate
Click "Calculate Discount" button

View detailed results below

3. Reset Options
Reset Button: Clears everything for new calculation

Clear Results: Only hides results, keeps inputs

4. Example Calculation
text
Original Price: $1,500,000.00
Discount: 18%
Discount Amount: $270,000.00
Final Price: $1,230,000.00
You Save: $270,000.00
🛠️ Technical Details
JSP Features Used
Scriptlets for Java logic

Expression Language (EL)

JSP Directives

Jakarta EE 10 (Tomcat 10.1 compatible)

Form Handling
jsp
<%-- Get form parameters --%>
<%
String priceStr = request.getParameter("price");
String discountStr = request.getParameter("discount");

// Calculation logic
double finalPrice = originalPrice - (originalPrice * discountPercent / 100);
%>
Form Validation
HTML5 required fields

JavaScript validation

Server-side validation

Discount range check (0-100%)

🌐 Browser Compatibility
✅ Chrome 80+

✅ Firefox 75+

✅ Safari 13+

✅ Edge 80+

✅ Mobile browsers

📱 Responsive Breakpoints
css
/* Desktop: 1024px and above */
/* Tablet: 768px - 1023px */
/* Mobile: 480px and below */
🔧 Troubleshooting
Common Issues & Solutions
Issue	Solution
404 Error	Check project is deployed to Tomcat
Form values reset	Ensure value="<%= param %>" syntax
No calculations	Check console for Java errors
Style not loading	Verify FontAwesome CDN is accessible
Server Logs
Check Eclipse Console for:

Deployment success messages

Java compilation errors

Tomcat startup logs

🎯 Learning Objectives
This project demonstrates:

JSP scriptlet implementation

Form handling with POST method

Jakarta EE compatibility

CSS styling for professional UI

Client-side JavaScript integration

Responsive web design principles

📚 Resources
Apache Tomcat 10 Documentation

Jakarta EE 10 Tutorial

JSP Tutorial - Oracle

FontAwesome Icons

🤝 Contributing
Fork the repository

Create a feature branch

Commit changes

Push to branch

Open Pull Request

📄 License
This project is for educational purposes. Feel free to modify and use.

👨‍💻 Author
Discount Calculator JSP Project
Created for learning Jakarta JSP development with Tomcat 10+

📞 Support
For issues or questions:

Check Troubleshooting section

Review server logs

Verify Tomcat configuration

Ensure Java version compatibility

💡 Tip: Use Ctrl + R for quick reset while testing different values!

