<h3>Quiz</h3>
<form method="post" action="/test/submit">
<ol type="1">
    <#list questions as question>
        <li>
            ${question.content}
                <input type="hidden" name="questionId" value=${question.id}>
                <ol type="a">
                <#list question.answers as answer>
                        <li>
                                <input type="radio" name="question_${question.id}" value="${answer.id}">
                                ${answer.content}
                        </li>
                </#list>
                </ol>
        </li>
    </#list>
</ol>
        <br>
        <input type="submit" value="Submit">
</form>