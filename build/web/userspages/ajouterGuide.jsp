<%-- 
    Document   : addguide
    Created on : 25 avr. 2025, 16:03:24
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire de guide - Administration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            font-family: sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        fieldset {
            border: none;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            padding: 30px;
            width: 100%;
            max-width: 600px;
        }

        legend {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            padding: 0 10px;
            margin-bottom: 20px;
            position: relative;
            text-align: center;
            width: 100%;
        }

        legend::after {
            content: '';
            display: block;
            width: 50px;
            height: 3px;
            background-color: #007bff;
            margin: 8px auto 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px 0;
            vertical-align: top;
        }

        td:first-child {
            width: 140px;
            font-weight: bold;
            color: #333;
            padding-top: 20px;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 0.5rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            outline: none;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .radio-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            margin-right: 15px;
        }

        .radio-option input[type="radio"] {
            margin-right: 5px;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.25rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-outline-secondary {
            color: #6c757d;
            border: 1px solid #6c757d;
            background-color: transparent;
            text-decoration: none;
        }

        .btn-outline-secondary:hover {
            background-color: #6c757d;
            color: white;
        }

        .d-flex {
            display: flex;
        }

        .justify-content-between {
            justify-content: space-between;
        }

        .mt-4 {
            margin-top: 1.5rem;
        }

        .form-check {
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
        }

        .form-check-input {
            margin-right: 0.5rem;
        }

        @media (max-width: 600px) {
            fieldset {
                padding: 20px;
            }

            td:first-child {
                display: block;
                width: 100%;
                padding-top: 0;
                padding-bottom: 5px;
            }

            td {
                display: block;
                padding: 5px 0;
            }
        }
    </style>
</head>
<body>
    <fieldset>
        <legend>Formulaire de guide</legend>
        <form method="POST" action="${pageContext.request.contextPath}/GuidesController">
            <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>" />
            <table>
                <tr class="form-group">
                    <td><label for="nom" class="form-label">Nom :</label></td>
                    <td><input type="text" class="form-control" id="nom" name="nom" value="<%= request.getParameter("nom") != null ? request.getParameter("nom") : "" %>" placeholder="Entrez le nom du guide" required /></td>
                </tr>

                <tr class="form-group">
                    <td><label for="email" class="form-label">Email :</label></td>
                    <td><input type="email" class="form-control" id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" placeholder="Entrez l'email" required /></td>
                </tr>

                <% if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) { %>
                <tr class="form-group">
                    <td><label for="motDePasse" class="form-label">Mot de passe :</label></td>
                    <td><input type="password" class="form-control" id="motDePasse" name="motDePasse" placeholder="Entrez le mot de passe" required /></td>
                </tr>
                <% } %>

                <tr class="form-group">
                    <td><label class="form-label">Langues parlées :</label></td>
                    <td>
                        <div class="row">
                            <div class="col-md-3 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="lang-Français" name="langues" value="Français" 
                                           <%= (request.getParameter("langues") != null && request.getParameter("langues").equals("Français")) ? "checked" : 
                                               (request.getParameter("langues") == null ? "checked" : "") %>>
                                    <label class="form-check-label" for="lang-Français">Français</label>
                                </div>
                            </div>
                            <div class="col-md-3 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="lang-Anglais" name="langues" value="Anglais"
                                           <%= (request.getParameter("langues") != null && request.getParameter("langues").equals("Anglais")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="lang-Anglais">Anglais</label>
                                </div>
                            </div>
                            <div class="col-md-3 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="lang-Espagnol" name="langues" value="Espagnol"
                                           <%= (request.getParameter("langues") != null && request.getParameter("langues").equals("Espagnol")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="lang-Espagnol">Espagnol</label>
                                </div>
                            </div>
                            <div class="col-md-3 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="lang-Allemand" name="langues" value="Allemand"
                                           <%= (request.getParameter("langues") != null && request.getParameter("langues").equals("Allemand")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="lang-Allemand">Allemand</label>
                                </div>
                            </div>
                            <div class="col-md-3 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="lang-Italien" name="langues" value="Italien"
                                           <%= (request.getParameter("langues") != null && request.getParameter("langues").equals("Italien")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="lang-Italien">Italien</label>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td class="d-flex justify-content-between mt-4">
                        <a href="/guides" class="btn btn-outline-secondary">Annuler</a>
                        <button type="submit" class="btn btn-primary"><%= request.getParameter("id") != null && !request.getParameter("id").isEmpty() ? "Modifier" : "Enregistrer" %></button>
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
</body>
</html>