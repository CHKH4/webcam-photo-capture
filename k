<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webcam Capture</title>
</head>
<body>
    <h1>Welcome! This website will automatically capture your photo when you open it.</h1>
    
    <!-- Video element to show the webcam feed -->
    <video id="video" width="640" height="480" autoplay></video>

    <!-- Canvas element to capture the photo -->
    <canvas id="canvas" style="display:none;"></canvas>

    <!-- Image element to display the captured photo -->
    <img id="photo" alt="Captured Photo" style="display:none;" />
    
    <script>
        // Access the user's webcam using WebRTC API
        const video = document.getElementById('video');
        const canvas = document.getElementById('canvas');
        const photo = document.getElementById('photo');

        async function setupWebcam() {
            try {
                const stream = await navigator.mediaDevices.getUserMedia({ video: true });
                video.srcObject = stream;
            } catch (err) {
                console.log('Error accessing webcam:', err);
            }
        }

        // Capture a photo as soon as the page is loaded
        function capturePhoto() {
            const context = canvas.getContext('2d');
            context.drawImage(video, 0, 0, canvas.width, canvas.height);
            const dataURL = canvas.toDataURL('image/png');
            photo.src = dataURL;  // Display the captured image
            photo.style.display = 'block';  // Make the photo visible
        }

        // Initialize webcam and capture the photo on page load
        window.onload = async function() {
            await setupWebcam();
            capturePhoto();
        };
    </script>
</body>
</html>
