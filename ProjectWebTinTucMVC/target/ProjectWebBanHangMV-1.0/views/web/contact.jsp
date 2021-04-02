<%-- 
    Document   : contact
    Created on : Feb 23, 2021, 7:18:43 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<c:url var="URLpost" value="/contact"></c:url>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Contact</title>
        </head>
        <body>
            <div class="row mt-4 mb-4">
                <div class="container">
                    <section class="jumbotron text-center">
                        <div class="container">
                            <h1 class="jumbotron-heading">OUR CONTACT</h1>
                            <p class="lead text-muted mb-0">Contact with our team !</p>
                        </div>
                    </section>
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-header bg-dark text-white"><i class="fa fa-envelope"></i> Contact us.
                                </div>
                                <div class="card-body">
                                    <form method="post" id="formSubmit">
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp" placeholder="Enter name" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email address</label>
                                            <input type="email" class="form-control" id="email" name="emailFrom" value = "" aria-describedby="emailHelp" placeholder="Enter email" required>
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="subject">Subject</label>
                                            <input type="text" class="form-control" id="subject" name="subject" value = "" placeholder="Enter subject" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="message">Message</label>
                                            <textarea class="form-control" id="message" name="message" rows="6" required></textarea>
                                        </div>
                                        <div class="mx-auto">
                                            <button type="submit" id="submit" class="btn btn-primary text-right">Submit</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-4">
                            <div class="card bg-light mb-3">
                                <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-home"></i> Address</div>
                                <div class="card-body">
                                    <p>3 rue des Champs Elysées</p>
                                    <p>75008 PARIS</p>
                                    <p>France</p>
                                    <p>Email : email@example.com</p>
                                    <p>Tel. +33 12 56 11 51 84</p>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
               
        </script>
    </body>
</html>
