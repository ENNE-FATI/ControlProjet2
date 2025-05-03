<%@page import="entities.Guide"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestion des Guides</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            padding: 30px;
        }

        fieldset {
            border: 2px solid #c92843;
            padding: 30px;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        legend {
            font-size: 1.5rem;
            color: #c92843;
            font-weight: bold;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 1rem;
            color: #333;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #c92843;
            outline: none;
        }

        .form-group input[type="submit"] {
            background-color: #c92843;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }

        .form-group input[type="submit"]:hover {
            background-color: #a91f35;
        }

        .form-group input[type="submit"]:active {
            background-color: #9b1d34;
        }

        .form-group input[type="submit"]:focus {
            outline: none;
        }

        .form-group input[type="text"] {
            font-size: 1rem;
        }

        .form-group td {
            padding: 5px;
        }
    </style>
</head>
<body>

    <fieldset>
        <legend>Formulaire Guide</legend>
        <form method="POST" action="${pageContext.request.contextPath}/GuidesController">
            <input type="hidden" name="id" value="${guide.id}" />
            <table>
                <tr class="form-group">
                    <td><label for="nom">Nom :</label></td>
                    <td><input type="text" id="nom" name="nom" value="${guide.nom}" required /></td>
                </tr>
                <tr class="form-group">
                    <td><label for="email">Email :</label></td>
                    <td><input type="text" id="email" name="email" value="${guide.email}" required /></td>
                </tr>
                <tr class="form-group">
                    <td><label for="motDePasse">Mot de passe :</label></td>
                    <td><input type="text" id="motDePasse" name="motDePasse" value="${guide.motDePasse}" required /></td>
                </tr>
                <tr class="form-group">
                    <td><label for="langue">Langue :</label></td>
                    <td><input type="text" id="langue" name="langue" value="${guide.langue}" required /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="${guide.id != null ? 'Modifier' : 'Ajouter'}" /></td>
                </tr>
            </table>
        </form>
    </fieldset>

</body>
</html>
