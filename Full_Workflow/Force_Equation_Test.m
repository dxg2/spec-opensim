% Use the functions 
% * Thelen2003_Passive_Force_Length
% * Thelen2003_Active_Force_Length
% * Thelen2003_Force_Velocity
% * Thelen2003_Tendon_Force

% to plot the standard force fraction curves

norm_fib_len = linspace(0, 1.67, 100);
norm_fib_vel = linspace(-1, 1, 100);
% tendon slack length for vastus intermedius
ten_slack_len = 0.13678598; 
% normalized by optimal muscle fiber length
norm_ten_slack_len = ten_slack_len / 0.12617328; 
norm_ten_len = linspace(0, 1.25*norm_ten_slack_len, 100);
% ten_strain = (norm_ten_len - norm_ten_slack_len)/norm_ten_slack_len;

active_FM = Thelen2003_Active_Force_Length(norm_fib_len);
passive_FM = Thelen2003_Passive_Force_Length(norm_fib_len);
velocity_FM = Thelen2003_Force_Velocity(norm_fib_vel);
tendon_FT = Thelen2003_Tendon_Force(norm_ten_len);

figure; clf;
f = gcf;
f.Units = 'normalized';
f.OuterPosition(2) = 0.3;
f.OuterPosition(3) = 0.65;
f.OuterPosition(4) = 0.5;
test_tiles = tiledlayout(1,2);
nexttile(1); hold on; box on; grid on;
set(groot,'DefaultLineLineWidth', 2);
title('Force-Length Curves for Muscle Fibers','FontSize',16,'FontWeight','normal')
plot(norm_fib_len, active_FM, 'b', 'DisplayName', 'Active')
plot(norm_fib_len, passive_FM, 'g', 'DisplayName', 'Passive')
plot(norm_fib_len, active_FM + passive_FM, 'c', 'DisplayName', 'Total')
legend('Location', 'northwest','AutoUpdate','off','FontSize',14)
plot([1 1],[0 1], '--', 'Color', [0.8 0.8 0.8])
plot([0 1],[1 1], '--', 'Color', [0.8 0.8 0.8])
xlabel('Normalized Fiber Length','FontSize',16)
ylabel('Normalized Muscle Force','FontSize',16)
gax = gca;
gax.FontSize = 16;

nexttile(2); hold on; box on; grid on;
set(groot,'DefaultLineLineWidth', 2);
title('Force-Velocity Curve for Muscle Fibers','FontSize',16,'FontWeight','normal')
plot(norm_fib_vel, velocity_FM, 'b')
plot([0 0],[0 1], '--', 'Color', [0.8 0.8 0.8])
plot([-1 0],[1 1], '--', 'Color', [0.8 0.8 0.8])
xticks([-1 -0.5 0 0.5 1])
xticklabels({'-1','\leftarrowConcentric', 'Iso.', 'Eccentric\rightarrow ', '1'})
xlabel('Normalized Fiber Velocity','FontSize',16)
ylabel('Normalized Muscle Force','FontSize',16)
gax = gca;
gax.FontSize = 16;