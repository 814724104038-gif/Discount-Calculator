<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discount Calculator | Professional Tool</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .calculator-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 550px;
            overflow: hidden;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .header {
            background: linear-gradient(to right, #4a6ee0, #6a11cb);
            color: white;
            padding: 25px;
            text-align: center;
            position: relative;
        }
        
        .header h1 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 15px;
        }
        
        .form-container {
            padding: 30px;
        }
        
        .input-group {
            margin-bottom: 25px;
        }
        
        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 16px;
        }
        
        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            color: #6a11cb;
            font-size: 18px;
        }
        
        .input-field {
            width: 100%;
            padding: 16px 16px 16px 50px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            outline: none;
        }
        
        .input-field:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
        }
        
        .currency-symbol, .percent-symbol {
            position: absolute;
            right: 15px;
            color: #777;
            font-weight: 500;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }
        
        .calculate-btn {
            background: linear-gradient(to right, #4a6ee0, #6a11cb);
            color: white;
            border: none;
            padding: 18px;
            flex: 2;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .reset-btn {
            background: linear-gradient(to right, #8e9eab, #eef2f3);
            color: #333;
            border: none;
            padding: 18px;
            flex: 1;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            border: 2px solid #ddd;
        }
        
        .calculate-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(106, 17, 203, 0.3);
        }
        
        .reset-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            background: linear-gradient(to right, #e0e0e0, #f5f5f5);
        }
        
        .calculate-btn:active, .reset-btn:active {
            transform: translateY(0);
        }
        
        .result-container {
            margin-top: 30px;
            padding: 25px;
            background: linear-gradient(to right, #f8f9ff, #f0f2ff);
            border-radius: 15px;
            border-left: 5px solid #6a11cb;
            animation: slideIn 0.5s ease-out;
            display: none;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .result-container.active {
            display: block;
        }
        
        .result-title {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #333;
            margin-bottom: 20px;
            font-size: 20px;
        }
        
        .result-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .result-row:last-child {
            border-bottom: none;
            font-weight: 700;
            color: #2e3b8f;
            font-size: 18px;
        }
        
        .result-label {
            color: #555;
        }
        
        .result-value {
            font-weight: 600;
            color: #333;
        }
        
        .highlight {
            color: #6a11cb;
            font-weight: 700;
        }
        
        .footer {
            text-align: center;
            padding: 20px;
            color: #777;
            font-size: 14px;
            border-top: 1px solid #eee;
        }
        
        .result-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
            gap: 10px;
        }
        
        .clear-btn {
            background: #f8f9fa;
            border: 2px solid #ddd;
            color: #666;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .clear-btn:hover {
            background: #e9ecef;
            color: #333;
        }
        
        /* Responsive Design */
        @media (max-width: 480px) {
            .form-container, .header {
                padding: 20px;
            }
            
            .header h1 {
                font-size: 24px;
            }
            
            .result-row {
                flex-direction: column;
                gap: 5px;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .calculate-btn, .reset-btn {
                flex: auto;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="calculator-container">
        <div class="header">
            <h1><i class="fas fa-percentage"></i> Discount Calculator</h1>
            <p>Calculate your savings with precision</p>
        </div>
        
        <div class="form-container">
            <form method="post" id="discountForm">
                <div class="input-group">
                    <label for="price"><i class="fas fa-tag"></i> Original Price</label>
                    <div class="input-wrapper">
                        <i class="fas fa-dollar-sign input-icon"></i>
                        <input type="number" 
                               id="price" 
                               name="price" 
                               class="input-field" 
                               step="0.01" 
                               min="0" 
                               placeholder="Enter amount"
                               value="<%= request.getParameter("price") != null ? request.getParameter("price") : "" %>"
                               required>
                        <span class="currency-symbol">$</span>
                    </div>
                </div>
                
                <div class="input-group">
                    <label for="discount"><i class="fas fa-percent"></i> Discount Percentage</label>
                    <div class="input-wrapper">
                        <i class="fas fa-percentage input-icon"></i>
                        <input type="number" 
                               id="discount" 
                               name="discount" 
                               class="input-field" 
                               step="0.01" 
                               min="0" 
                               max="100" 
                               placeholder="Enter discount %"
                               value="<%= request.getParameter("discount") != null ? request.getParameter("discount") : "" %>"
                               required>
                        <span class="percent-symbol">%</span>
                    </div>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="calculate-btn">
                        <i class="fas fa-calculator"></i> Calculate Discount
                    </button>
                    <button type="button" class="reset-btn" id="resetFormBtn">
                        <i class="fas fa-redo-alt"></i> Reset
                    </button>
                </div>
            </form>
            
            <% 
                // Initialize variables
                String priceStr = request.getParameter("price");
                String discountStr = request.getParameter("discount");
                double originalPrice = 0;
                double discountPercent = 0;
                double discountAmount = 0;
                double finalPrice = 0;
                boolean showResult = false;
                
                // Create currency formatter
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);
                
                // Calculate if parameters exist
                if (priceStr != null && discountStr != null && 
                    !priceStr.isEmpty() && !discountStr.isEmpty()) {
                    try {
                        originalPrice = Double.parseDouble(priceStr);
                        discountPercent = Double.parseDouble(discountStr);
                        
                        // Validate discount range
                        if (discountPercent < 0) discountPercent = 0;
                        if (discountPercent > 100) discountPercent = 100;
                        
                        // Calculate
                        discountAmount = originalPrice * discountPercent / 100.0;
                        finalPrice = originalPrice - discountAmount;
                        showResult = true;
                    } catch (NumberFormatException e) {
                        // Invalid input - handled by HTML5 validation
                    }
                }
            %>
            
            <% if (showResult) { %>
                <div class="result-container active" id="resultContainer">
                    <div class="result-title">
                        <i class="fas fa-file-invoice-dollar"></i>
                        <span>Calculation Results</span>
                    </div>
                    
                    <div class="result-row">
                        <span class="result-label">Original Price:</span>
                        <span class="result-value"><%= currencyFormat.format(originalPrice) %></span>
                    </div>
                    
                    <div class="result-row">
                        <span class="result-label">Discount Rate:</span>
                        <span class="result-value"><%= String.format("%.2f", discountPercent) %>%</span>
                    </div>
                    
                    <div class="result-row">
                        <span class="result-label">Discount Amount:</span>
                        <span class="result-value highlight"><%= currencyFormat.format(discountAmount) %></span>
                    </div>
                    
                    <div class="result-row">
                        <span class="result-label">Final Price:</span>
                        <span class="result-value highlight"><%= currencyFormat.format(finalPrice) %></span>
                    </div>
                    
                    <div class="result-row">
                        <span class="result-label">You Save:</span>
                        <span class="result-value highlight" style="color: #4CAF50;">
                            <%= currencyFormat.format(discountAmount) %>
                        </span>
                    </div>
                    
                    <div class="result-actions">
                        <button type="button" class="clear-btn" id="clearResultsBtn">
                            <i class="fas fa-times-circle"></i> Clear Results
                        </button>
                    </div>
                </div>
            <% } %>
        </div>
        
        <div class="footer">
            <p><i class="far fa-copyright"></i> 2024 Discount Calculator Pro | Jakarta JSP</p>
        </div>
    </div>

    <script>
        // Reset form functionality
        document.getElementById('resetFormBtn').addEventListener('click', function() {
            // Clear form fields
            document.getElementById('price').value = '';
            document.getElementById('discount').value = '';
            
            // Hide results
            const resultContainer = document.getElementById('resultContainer');
            if (resultContainer) {
                resultContainer.classList.remove('active');
            }
            
            // Focus on price field
            document.getElementById('price').focus();
            
            // Reset URL to remove query parameters
            history.replaceState(null, '', window.location.pathname);
        });
        
        // Clear results only (keep form values)
        const clearResultsBtn = document.getElementById('clearResultsBtn');
        if (clearResultsBtn) {
            clearResultsBtn.addEventListener('click', function() {
                const resultContainer = document.getElementById('resultContainer');
                if (resultContainer) {
                    resultContainer.classList.remove('active');
                }
            });
        }
        
        // Form validation
        document.getElementById('discountForm').addEventListener('submit', function(e) {
            const price = document.getElementById('price').value;
            const discount = document.getElementById('discount').value;
            
            if (!price || !discount) {
                e.preventDefault();
                alert('Please fill in both fields');
                return;
            }
            
            // Validate discount range
            if (parseFloat(discount) < 0 || parseFloat(discount) > 100) {
                e.preventDefault();
                alert('Discount percentage must be between 0 and 100');
                return;
            }
            
            // Show result section if hidden
            setTimeout(() => {
                const resultContainer = document.getElementById('resultContainer');
                if (resultContainer) {
                    resultContainer.classList.add('active');
                    resultContainer.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                }
            }, 100);
        });
        
        // Auto-format price on blur
        document.getElementById('price').addEventListener('blur', function() {
            let value = parseFloat(this.value);
            if (!isNaN(value)) {
                this.value = value.toFixed(2);
            }
        });
        
        // Auto-format discount on blur
        document.getElementById('discount').addEventListener('blur', function() {
            let value = parseFloat(this.value);
            if (!isNaN(value)) {
                this.value = value.toFixed(2);
            }
        });
        
        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            // Ctrl + R to reset
            if (e.ctrlKey && e.key === 'r') {
                e.preventDefault();
                document.getElementById('resetFormBtn').click();
            }
            
            // Escape to clear results
            if (e.key === 'Escape') {
                const resultContainer = document.getElementById('resultContainer');
                if (resultContainer && resultContainer.classList.contains('active')) {
                    document.getElementById('clearResultsBtn')?.click();
                }
            }
        });
    </script>
</body>
</html>