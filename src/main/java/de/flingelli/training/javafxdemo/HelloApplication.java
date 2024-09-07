package de.flingelli.training.javafxdemo;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class HelloApplication extends Application {

    @Override
    public void start(Stage stage) {
        BorderPane borderPane = new BorderPane();
        GridPane gridPane = new GridPane(3, 1);
        borderPane.setTop(gridPane);

        gridPane.add(new Label("Dein Name: "), 0, 1);

        TextField textField = new TextField("");
        gridPane.add(textField, 1, 1);

        Label display = new Label();
        borderPane.setCenter(display);

        gridPane.add(createSayHelloButton("Sage hallo!", textField, display), 2,1 );
        Scene scene = new Scene(borderPane, 600, 200);
        stage.setTitle("JavaFX Demo");
        stage.setScene(scene);
        stage.show();
    }

    private Button createSayHelloButton(String title, TextField textField, Label label) {
        Button button = new Button(title);
        button.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent actionEvent) {
                if (textField.getText().isEmpty()) {
                    label.setText(label.getText() + "\nHallo unbekannter Nutzer!");
                } else {
                    label.setText(label.getText() + "\nHallo " + textField.getText() + "!");
                }
            }
        });
        return button;
    }

    public static void main(String[] args) {
        launch();
    }
}