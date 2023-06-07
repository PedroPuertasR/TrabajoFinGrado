package com.pedropuertas.dam.tiendatatuajes.seguridad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import com.pedropuertas.dam.tiendatatuajes.repositorio.UserRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
    private UserRepository usuarios;
	
	private static InMemoryUserDetailsManager userDetailsManager = new InMemoryUserDetailsManager();

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService());
    }
	
     @Override
	protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().permitAll()
                .and().exceptionHandling().accessDeniedPage("/")
                .and().formLogin().loginPage("/").loginProcessingUrl("/login").failureUrl("/login-error").permitAll()
                .and().formLogin().defaultSuccessUrl("/admin/")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/").permitAll()
                .and().headers().frameOptions().disable();

    }
	
    @Bean
    @Override
    public UserDetailsService userDetailsService() {

        usuarios.cargarUsuarios()
        	.stream()
        	.map(m -> {
        		return User
        				.withUsername(m.getUsername())
        				.password("{noop}" + m.getPassword())
        				.roles(m.getRol())
        				.build();
        })
        	.forEach(userDetailsManager::createUser);


        return userDetailsManager;


    }
    
    public void crearUsuario(String username, String password, String rol) {
        UserDetails nuevoUsuario = User
                .withUsername(username)
                .password("{noop}" + password)
                .roles(rol)
                .build();
        userDetailsManager.createUser(nuevoUsuario);
        
    }
    
}
