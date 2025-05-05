<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MM2 Trade Premium UI</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #000;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }
        
        .background {
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #1a0033, #000033);
            z-index: -1;
        }
        
        .stars {
            position: absolute;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(white, rgba(255,255,255,.2) 2px, transparent 7px),
                radial-gradient(white, rgba(255,255,255,.15) 1px, transparent 5px),
                radial-gradient(white, rgba(255,255,255,.1) 2px, transparent 6px);
            background-size: 550px 550px, 350px 350px, 250px 250px;
            background-position: 0 0, 40px 60px, 130px 270px;
            z-index: -1;
        }
        
        .glow {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(128, 0, 255, 0.4) 0%, rgba(128, 0, 255, 0) 70%);
            z-index: -1;
        }
        
        .container {
            position: relative;
            width: 320px;
            max-width: 90vw;
        }
        
        .loading-container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(128, 0, 255, 0.6);
            border: 1px solid rgba(128, 0, 255, 0.5);
        }
        
        .loading-title {
            font-size: 24px;
            margin-bottom: 15px;
            color: #f5f5f5;
            text-shadow: 0 0 5px #a64dff;
        }
        
        .loading-subtitle {
            font-size: 14px;
            color: #cccccc;
            margin-bottom: 20px;
        }
        
        .loading-bar-container {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            height: 12px;
            margin-bottom: 10px;
        }
        
        .loading-bar {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #a64dff, #ff00ff);
            border-radius: 10px;
            transition: width 3s ease;
            box-shadow: 0 0 10px #a64dff;
        }
        
        .loading-percentage {
            font-size: 12px;
            color: #cccccc;
            text-align: right;
            margin-bottom: 20px;
        }
        
        .ui-container {
            display: none;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            padding: 15px;
            box-shadow: 0 0 25px rgba(128, 0, 255, 0.8);
            border: 1px solid rgba(128, 0, 255, 0.7);
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 1px solid rgba(128, 0, 255, 0.4);
            padding-bottom: 10px;
        }
        
        .title {
            font-size: 22px;
            font-weight: bold;
            background: linear-gradient(90deg, #a64dff, #ff33cc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 10px rgba(128, 0, 255, 0.5);
        }
        
        .premium-badge {
            background: linear-gradient(45deg, #ffd700, #ff8c00);
            color: black;
            font-size: 10px;
            font-weight: bold;
            padding: 3px 8px;
            border-radius: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .subtitle {
            font-size: 10px;
            color: #aaa;
            margin-top: -5px;
            margin-bottom: 10px;
            text-align: right;
        }
        
        .control-section {
            margin-bottom: 15px;
        }
        
        .control-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(40, 10, 60, 0.6);
            padding: 10px 15px;
            border-radius: 12px;
            margin-bottom: 8px;
            border: 1px solid rgba(128, 0, 255, 0.3);
        }
        
        .control-row:hover {
            background-color: rgba(60, 20, 90, 0.6);
            border: 1px solid rgba(128, 0, 255, 0.6);
            box-shadow: 0 0 15px rgba(128, 0, 255, 0.3);
        }
        
        .control-label {
            font-size: 16px;
            font-weight: bold;
            color: #f5f5f5;
        }
        
        .toggle {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 26px;
        }
        
        .toggle input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            transition: .4s;
            border-radius: 34px;
            border: 1px solid rgba(128, 0, 255, 0.5);
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 4px;
            bottom: 3px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background: linear-gradient(90deg, #a64dff, #ff00ff);
        }
        
        input:checked + .slider:before {
            transform: translateX(24px);
        }
        
        .divider {
            height: 1px;
            background: linear-gradient(90deg, rgba(128, 0, 255, 0), rgba(128, 0, 255, 0.5), rgba(128, 0, 255, 0));
            margin: 10px 0;
        }
        
        .footer {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #888;
            margin-top: 15px;
        }
        
        .premium-features {
            margin-top: 10px;
        }
        
        .premium-feature {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #ddd;
            margin-bottom: 8px;
        }
        
        .premium-icon {
            width: 16px;
            height: 16px;
            background-color: #a64dff;
            border-radius: 50%;
            margin-right: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 10px;
            color: white;
        }
        
        .close-button {
            position: absolute;
            top: 10px;
            right: 15px;
            color: #aaa;
            font-size: 20px;
            cursor: pointer;
        }
        
        .close-button:hover {
            color: white;
        }
        
        .button {
            background: linear-gradient(90deg, #a64dff, #ff00ff);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            width: 100%;
            margin-top: 10px;
            font-size: 14px;
            box-shadow: 0 0 10px rgba(128, 0, 255, 0.5);
        }
        
        .button:hover {
            background: linear-gradient(90deg, #b366ff, #ff33cc);
            box-shadow: 0 0 15px rgba(128, 0, 255, 0.8);
        }
        
        .advanced-options {
            margin-top: 15px;
        }
        
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="stars"></div>
    <div class="glow"></div>
    
    <div class="container">
        <div class="loading-container" id="loading-container">
            <div class="loading-title">MM2 TRADE PREMIUM</div>
            <div class="loading-subtitle">Loading premium features...</div>
            <div class="loading-bar-container">
                <div class="loading-bar" id="loading-bar"></div>
            </div>
            <div class="loading-percentage" id="loading-percentage">0%</div>
        </div>
        
        <div class="ui-container" id="ui-container">
            <div class="close-button">×</div>
            <div class="header">
                <div>
                    <div class="title">MM2 Trade</div>
                    <div class="subtitle">v3.2 PREMIUM</div>
                </div>
                <div class="premium-badge">PREMIUM</div>
            </div>
            
            <div class="control-section">
                <div class="control-row">
                    <div class="control-label">AUTO ADD ITEMS</div>
                    <label class="toggle">
                        <input type="checkbox" checked>
                        <span class="slider"></span>
                    </label>
                </div>
                
                <div class="control-row">
                    <div class="control-label">FORCE ACCEPT</div>
                    <label class="toggle">
                        <input type="checkbox">
                        <span class="slider"></span>
                    </label>
                </div>
                
                <div class="control-row">
                    <div class="control-label">FREEZE VICTIM'S GAME</div>
                    <label class="toggle">
                        <input type="checkbox">
                        <span class="slider"></span>
                    </label>
                </div>
            </div>
            
            <div class="divider"></div>
            
            <div class="premium-features">
                <div class="premium-feature">
                    <div class="premium-icon">★</div>
                    <div>Auto Dupe Godlys</div>
                </div>
                <div class="premium-feature">
                    <div class="premium-icon">★</div>
                    <div>Instant Trade Success</div>
                </div>
                <div class="premium-feature">
                    <div class="premium-icon">★</div>
                    <div>Item Value Spoofer</div>
                </div>
            </div>
            
            <div class="advanced-options">
                <div class="button">START PREMIUM SCRIPT</div>
            </div>
            
            <div class="footer">
                <div>PREMIUM USER</div>
                <div>v3.2</div>
            </div>
        </div>
    </div>
    
    <script>
        // Simulate loading progress
        const loadingBar = document.getElementById('loading-bar');
        const loadingPercentage = document.getElementById('loading-percentage');
        const loadingContainer = document.getElementById('loading-container');
        const uiContainer = document.getElementById('ui-container');
        
        let progress = 0;
        const interval = setInterval(() => {
            progress += Math.random() * 3;
            if (progress >= 100) {
                progress = 100;
                clearInterval(interval);
                loadingBar.style.width = '100%';
                loadingPercentage.textContent = '100%';
                
                // Show UI after loading completes
                setTimeout(() => {
                    loadingContainer.style.display = 'none';
                    uiContainer.style.display = 'block';
                }, 500);
            } else {
                loadingBar.style.width = progress + '%';
                loadingPercentage.textContent = Math.floor(progress) + '%';
            }
        }, 100);
    </script>
</body>
</html>
