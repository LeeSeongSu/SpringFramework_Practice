package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@RequiredArgsConstructor
public class Restaurant {

	private final Chef chef;
}
