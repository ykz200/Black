package com.bhusk.black.conf;


import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.Http11NioProtocol;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * config class
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    /**
     * 错误页面处理
     * @return
     */
    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return new EmbeddedServletContainerCustomizer(){
            @Override
            public void customize(ConfigurableEmbeddedServletContainer container) {
                /**
                 * 设置session时间
                 */
                container.setSessionTimeout(0);//单位为S

                container.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST, "/error-pages/400"));
                container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error-pages/500"));
                container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error-pages/404"));
            }
        };
    }


}
class MyTomcatConnectorCustomizer implements TomcatConnectorCustomizer
{
    @Override
    public void customize(Connector connector)
    {
        Http11NioProtocol protocol = (Http11NioProtocol) connector.getProtocolHandler();
        //设置最大连接数
        protocol.setMaxConnections(2000);
        //设置最大线程数
        protocol.setMaxThreads(2000);
        protocol.setConnectionTimeout(30000);
    }
}